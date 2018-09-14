#! /bin/sh 


# NB. Change the permissions to run the shscripts using chmod +x *.sh

# how to use
#./pomodoro_mx.sh number of pomodoros 
# for instance
#./pomodoro_mx.sh 2


#http://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal

countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo " P$2(" "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S) ) ";
     sleep 1
   done
}


countdownbreak(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo " B$2(" "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S) ) ";
     sleep 1
   done
}



_alarm() {
  ( \speaker-test --frequency $1 --test sine )& pid=$!
  \sleep 0.${2}s
  \kill -9 $pid
}

#which is called with frequency and duration arguments:
#_alarm 400 500
#http://unix.stackexchange.com/questions/1974/how-do-i-make-my-pc-speaker-beep


#sleep 1500 && notify-send "break" # 1500 is equal to 25 minutes
#sleep 300 && notify-send "back to work"  # a short, 5-minute break
#sleep 900 && notify-send "back to work"  # a long, 15-minute break
#http://superuser.com/questions/224265/pomodoro-timer-for-linux


#sleep 1 && _alarm 400 500 &&  zenity --warning --text="25 minutes passed"  
#sleep 10 && _alarm 400 500 &&  notify-send "break"; 
#sleep 5 && _alarm 400 500 && notify-send "back to work"


#http://unix.stackexchange.com/questions/31414/how-can-i-pass-a-command-line-argument-into-a-shell-script

#http://stackoverflow.com/questions/1445452/shell-script-for-loop-syntax

max=$1
for k in `seq 1 $max`
do
    #echo "$k"
	echo ">>>>>>>>>>>>> 25 min <<<<<<<<<<<<<"
	echo "startime"
	date
    	countdown 1500 $k && _alarm 400 900 &&  notify-send "BREAK";  
	echo stoptime
	date
    	echo ">>>>>>>>>>>>> 5 min <<<<<<<<<<<<<"
    	countdownbreak 310 $k && _alarm 400 900 &&  notify-send "BACK TO RESEARCH"; 
done



