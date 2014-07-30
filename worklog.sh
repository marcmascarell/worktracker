#!/bin/bash

repeat_secs=300
date=`date +%d-%m-%Y`

while [ 1 ];
do 
  windows=$(wmctrl -l | grep "PhpStorm\|Pycharm")
  windows_array=($windows)

  found=0
  work=()
  time=$(date +'%H:%M')
  for i in ${windows_array[@]}; do
    
      if [ "$found" = "1" ];
	then
	  work+=($i)
	  found=0
      fi
    
      if [ "$i" = "$USER" ];
	then
	  found=1
      fi
    
  done

  echo $time ${work[@]} >> "$date.log"

  sleep $repeat_secs;
done