createPng1 <- function ()
{
  # download the data if it doesn't exist yet
  if (!file.exists("household_power_consumption.txt")) {
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip")
    unzip("power_consumption.zip")
  }

  #load the data and get a subset of it for the dates 1/2/2007 and 2/2/2007
  data = read.table("household_power_consumption.txt",sep = ";", header=TRUE,  na.strings ="?", colClasses = c(rep("character",2), rep("numeric",7)))
  data$Date= as.Date(data$Date, "%d/%m/%Y")
  subsetData = data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]

  # plot the histogram to a png
  png("plot1.png", width = 480, height = 480)
  
  hist(subsetData$Global_active_power,
       xlab = "Global Active Power (kilowatts)", 
       main = "Global Active Power",
       col = "red")
  
  dev.off()
  
}