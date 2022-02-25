setwd("/Users/toyerinde/Desktop/DataScience")
# Reading in the subset of data needed for plot generation
electric_data<-read.table("./Exploratory Analysis/household_power_consumption.txt",sep =";",skip =66637,nrows= 2880)
colnames(electric_data)<-c("Date","Time","Global_active_power","Global_reactive_power", "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(electric_data)
tail(electric_data)
str(electric_data)
# Combine Date time column into Date_time column
electric_data$Date_time<-paste(electric_data$Date,electric_data$Time,sep= " ")
electric_data_new<-electric_data[c("Date_time","Global_active_power","Global_reactive_power", "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")]
head(electric_data_new)
str(electric_data_new)
electric_data_new[["Date_time"]]<-strptime(electric_data_new[["Date_time"]],format="%d/%m/%Y %H:%M:%S")
#Generating Plot 2 and saving to png file
library(lubridate)
# create weekday column
library(dplyr)
electric_data_newtb<-tibble::as_tibble(electric_data_new)
head(electric_data_newtb)
#electric_data_newtb_2<-mutate(electric_data_newtb, weekday = wday(electric_data_newtb$Date_time, label = TRUE))
#str(electric_data_newtb_2)
png(filename= "plot2.png",width=480,height=480)
plot(electric_data_newtb$Date_time,electric_data_newtb$Global_active_power,type = "l", ylab = "Global Active Power(kilowatts)",xlab = " ")
dev.off()