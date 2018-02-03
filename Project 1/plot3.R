setwd("C:/Users/manif/Desktop/Coursera/exdata%2Fdata%2Fhousehold_power_consumption")
data<- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
filter <- subset(data, subset = (Date >= "2007-2-1" & Date <= "2007-2-2"))
rm(data)
dateTime <- paste(as.Date(filter$Date), filter$Time)
dateTime <- setNames(dateTime, "DateTime")
filter <- cbind(dateTime, filter)
filter$dateTime <- as.POSIXct(dateTime)
with(filter, {
  plot(Sub_metering_1~dateTime, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~dateTime, col = 'Red')
  lines(Sub_metering_3~dateTime, col = 'Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd = c(2,2,2), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()


