# !/bin/bash


#To give the variable name to the bucket and user name  so we can use the variable name while giving bucket details.

s3_bucket="upgrad-sarankumar"
name="sarankumar"


#To Perform an update of the package details  

sudo apt update -y

#To check the apache2 is installed or not

dpkg -s apache2

#To install apache2

if [$? -eq 0]
then 
	echo "apache2 is server is already installed."
else
	echo "Installing apache2"
	sudo apt install apache2 -y
fi

#To Ensure that the apache2 service is running. 

ps -ef|grep apache2

#To Ensure that the apache2 service is enabled.

sudo systemctl is-enabled apache2

if [$? -eq 0]
then 
	echo "apache2 is enabled"
else 
	echo "Enabling "
	sudo service apache2 enable
fi


#To install aws cli 

sudo apt install awscli

#To copy the archive to the s3 bucket

aws s3 \
cp /tmp/sarankumar-httpd-logs-01212021-111010.tar \
s3://upgrad-sarankumar/sarankumar-httpd-logs-01212021-111010.tar


