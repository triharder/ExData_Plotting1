pwr <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
pwr$Date <- as.Date(pwr$Date,"%d/%m/%Y")
#pwr$Time <- NULL
days <- subset(pwr,pwr$Date >= "2007-02-01" & pwr$Date <= "2007-02-02")
days$Time <- as.POSIXct(strptime(paste(days$Date, days$Time), "%Y-%m-%d %H:%M:%S"))
row.names(days) <- NULL

colors <- c("black","red","blue")

with(days, plot(Time,Sub_metering_1,type="l", xlab="", ylab="Energy sub metering"))
with(days,(lines(Time,Sub_metering_2,col="red")))
with(days,(lines(Time,Sub_metering_3,col="blue")))

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = colors, lty=1, xjust=1, xpd=F)

## Copy plot to a PNG file
dev.copy(png, file = "plot3.png", height=480, width=480, units="px")
dev.off()