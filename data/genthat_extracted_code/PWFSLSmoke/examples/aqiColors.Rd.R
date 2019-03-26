library(PWFSLSmoke)


### Name: aqiColors
### Title: Generate AQI Colors
### Aliases: aqiColors
### Keywords: plotting ws_monitor

### ** Examples

wa <- monitor_subset(Northwest_Megafires, stateCodes='WA', tlim=c(20150821,20150828))
colorMatrix <- aqiColors(wa)
time <- wa$data$datetime
pm25 <- wa$data[,-1]
plot(time, pm25[,1], col=colorMatrix[,1],
     ylim=range(pm25, na.rm=TRUE),
     xlab="2015", ylab="PM 2.5 (ug/m3)", main="Washington State Smoke")
for ( i in seq_along(pm25) ) {
  points(time, pm25[,i], col=colorMatrix[,i], pch=16)
}



