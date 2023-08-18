#!/bin/bash
#Purpose: OpenSource BloodSugar Tracker
#Created Date: 01/13/2023
#Author: PeterDawsonSW
#LINKS:
#https://stackoverflow.com/questions/31929621/echo-multiple-variables-in-same-line-bash
#https://www.baeldung.com/linux/csv-parsing
#https://linuxize.com/post/bash-functions/


#### Functions ###############################################################################

### inputPrompt 
function inputPrompt {
    echo "Press [1] [2] or [3] please"
    echo ""
    #+++ Enter the value 0 - 600
    read NUMBER
    echo ""
}

### option One
function optionOneLog {
    echo "############################ Enter your measured BloodSugar ############################"
    read bloodsugar
    DATE=$(date)
    echo $DATE,$bloodsugar >> BloodSugarLOG
    echo "############################ Value was logged ##########################################"
    echo ""
}

### option Two
function optionTwoAverage {
    arr_values=( $(tail -n +2 BloodSugarLOG | cut -d ',' -f2) )
    while read -a rows
        do
        total=0
        sum=0
        for i in "${arr_values[@]}"
        do
            ((sum += $i))
            ((total++))
        done
        echo $((sum/total))
    done <BloodSugarLOG
    echo ""
}

#### End of Functions ###############################################################################

echo ""
echo "########################################################################################"
echo "############################ BloodSugar Tracking by bloodsugarDRACULA ##################"
echo "########################################################################################"
echo ""
echo ""
echo "Option [1] for: #Log BloodSugar value:"
echo "Option [2] for: #Output of the average"
echo "Option [3] for: #exit"
echo ""
while [ true ]
do
    ### function inputPrompt 
    inputPrompt
if [ "$NUMBER" = 1 ];
then
    ### function optionOne 
    optionOneLog
elif [ "$NUMBER" = 2 ];
then
    ### function optionTwo 
    optionTwoAverage
elif [ "$NUMBER" = 3 ];
then
    echo "############################ Exiting the Script ########################################"
    break
fi

done;