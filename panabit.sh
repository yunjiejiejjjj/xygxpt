#!/bin/bash ######Version 2 By Maosen 20170419######
# author Maosen Sun <sunnymaosen@gmail.com,sun285529808@qq.com>
# copyright Maosen Sun
# organization EmulatedLab(QQ Group:593920308)
# @link http://www.eve-ng.com
# @version 20170511
qemu=$(pwd)
icon="/opt/unetlab/html/images/icons"
include="/opt/unetlab/html/includes"
template="/opt/unetlab/html/templates" 
if [ ${qemu:25:8} == 'panabit-' ]
then
	mv -f $qemu/Panabit.png $icon/Panabit.png
	mv -f $qemu/panabit.php $template/panabit.php
	if grep -i \'panabit\' $include/init.php > /dev/null
	then
		echo -e "\033[33mSorry!!!\033[0m Maybe you has already import it!"
	else
		sed -i "/Virtual PC/i\\\t\t'panabit'\t\t\t=>\t'Panabit'," $include/init.php
		echo -e "\033[31mGreat!!!\033[0m \"Panabit Device\" import successfully!!!"
	fi
	rm -rf $qemu/panabit.sh
else
	echo -e "\033[31mSorry!!!\033[0m Your folder name is NOT legal, please modify the directory name, then run the script again !!! \n\033[32mFor example: \"panabit-xxxx\"\033[0m"
fi

