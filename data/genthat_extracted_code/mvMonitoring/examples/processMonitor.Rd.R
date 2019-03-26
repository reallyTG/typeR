library(mvMonitoring)


### Name: processMonitor
### Title: Adaptive Process Training
### Aliases: processMonitor

### ** Examples

nrml <- mspProcessData(faults = "NOC")
data <- nrml[nrml[,1] == 1]

processMonitor(data = data[,-1], trainObs = 672)




