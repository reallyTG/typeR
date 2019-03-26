library(Data2LD)


### Name: RefineryData
### Title: Reflux and tray level in a refinery
### Aliases: RefineryData
### Keywords: datasets

### ** Examples

#  input the data
TimeData <- RefineryData[,1]
TrayData <- RefineryData[,2]
ValvData <- RefineryData[,3]
#  plot the data
par(mfrow=c(2,1))
plot(TimeData, TrayData, type="p") 
lines(c(67,67), c(0,4.0), type="l")
plot(TimeData, ValvData, type="p")
lines(c(67,67), c(0,0.5), type="l")



