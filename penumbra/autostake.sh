#!/bin/bash
#echo "-----------------------------------------------------------------------------"
#curl -s https://raw.githubusercontent.com/DOUBLE-TOP/tools/main/doubletop.sh | bash
#echo "-----------------------------------------------------------------------------"

validator=$(pcli query validator list 2>&1 | grep penumbra | tail -n 1 | awk '{print $6}')
echo "-----------------------------------------------------------------------------"
echo "Прописываем валидатора"
echo $validator
echo "-----------------------------------------------------------------------------"

current_balance=$(pcli view balance | grep penumbra | awk '{ print $2 }' | tr -d 'penumbra' | head -1) &>/dev/null
dif=10
sleep 15
stake_balance=$(($current_balance-$dif))
echo "-----------------------------------------------------------------------------"
echo "Выводим баланс для стейкинга "
echo $stake_balance
echo "-----------------------------------------------------------------------------"
stake=$(pcli tx delegate "${stake_balance}"penumbra --to $validator) &>/dev/null
sleep 15
echo "-----------------------------------------------------------------------------"
echo "Стейкаем монетки валидатору"
echo $stake
echo "-----------------------------------------------------------------------------"
