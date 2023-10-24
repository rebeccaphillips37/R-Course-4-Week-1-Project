#-----------------------------------------------------------------------------
# PLOT 3
#-----------------------------------------------------------------------------


#-----------------------------------------------------------------------------
# I MANUALLY REMOVED ALL QUOTES IN THE TEXT FILE, SO READ IN THIS DATASET.
# I ALREADY FILTERED TO JUST INCLUDE 1 AND 2 FENRUARY 2007.
#-----------------------------------------------------------------------------
data = read.table("household_power_consumption_filtered_noquotes.txt",
	header=TRUE,sep=",")
data[1:5,]
colnames(data)

#  [1] "Index"                 "Date"                  "Time"                 
#  [4] "Global_active_power"   "Global_reactive_power" "Voltage"              
#  [7] "Global_intensity"      "Sub_metering_1"        "Sub_metering_2"       
# [10] "Sub_metering_3"


#-----------------------------------------------------------------------------
# CHECK THAT THE COLUMNS ARE NUMERIC - ALL BUT DATE AND TIME ARE.
#-----------------------------------------------------------------------------
is.numeric(data[,1])
is.numeric(data[,2])
is.numeric(data[,3])
is.numeric(data[,4])
is.numeric(data[,5])
is.numeric(data[,6])
is.numeric(data[,7])
is.numeric(data[,8])
is.numeric(data[,9])


#-----------------------------------------------------------------------------
# PLOT 3
#-----------------------------------------------------------------------------
Axis = c("Thu",rep("Fri",1439),rep("Sat",1440))
Index2 = 1:2880
plot(Index2,data$Sub_metering_1,type="l",col="black",xlab="",
	ylab = "Energy sub metering",xaxt="n")
points(Index2,data$Sub_metering_2,type="l",col="red")
points(Index2,data$Sub_metering_3,type="l",col="blue")
axis(side=1,at=Index2[c(1,1440,2880)],labels=c("Thu","Fri","Sat"))
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
	c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()