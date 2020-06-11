#!/bin/bash

PS3='Choose eosio.cdt version: ' # 设置提示符字串.

echo

select version in "v1.5.2" "v1.6.2" "v1.7.0"
do
  echo
  echo "You select eosio.cdt $version."
  echo
  break  # 如果这里没有 'break' 将不停循环进行选择
done


SOURCE=`echo $(pwd) |sed 's/\/mnt//g'`
DOCKER_BASE="docker run -it --rm -v $SOURCE:/contract zhopen/eosio.cdt:$version "
alias eosio-cpp='$DOCKER_BASE bash -c "cd contract;eosio-cpp" '
alias make="$DOCKER_BASE"'bash -c "cd /contract;make"'
alias eosiocdt="$DOCKER_BASE"'bash -c "cd /contract;bash"'
