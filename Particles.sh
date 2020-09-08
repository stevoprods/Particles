#!/bin/bash


Particles=`cut -c 1-9 $1 | sort -u`
Total=`echo "$Particles" | wc -l`
printf  "Total Species = %d\n\n" $Total
printf "Species Information:\n\n"    
echo 'Name         Count     Minimum      Maximum      Average'
echo '--------     -----     ---------    ---------    ---------'
for i in $Particles
	do
	Momentum=`grep $i $1 | cut -c 10-`
	Count=`echo "$Momentum" | wc -l`
	Min=`echo "$Momentum" | numbound -l`
        Max=`echo "$Momentum" | numbound`
	Avg=`echo "$Momentum" | numaverage`
	
	printf "%-13s%5d%13f%13f%13f\n" $i $Count $Min $Max $Avg
	done
