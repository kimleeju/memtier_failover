#cat result.txt | awk '{print $10}' > result_iops.txt
rm result_iops.txt
cnt=10
while [ 1 ]; do
	cat result.txt | head -n $cnt | tail -n 10 | awk '{sum+=$10} END{print sum}' >> result_iops.txt
	cnt=$(($cnt+1))
	
	if [[ $cnt == 175 ]]; then
		break
	fi
done

:<<'END'
cnt=10

while [ 1 ]; do
	cat result_iops.txt | head -n $cnt | tail -n 10
	cnt=$(($cnt+1))
	
	if [[ $cnt == 11 ]]; then
#	if [[ $cnt == `cat result.txt | wc -l `]]; then
		break
	fi
done
END
