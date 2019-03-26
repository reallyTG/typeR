library(mvMonitoring)


### Name: faultFilter
### Title: Process Fault Filtering
### Aliases: faultFilter

### ** Examples

nrml <- mspProcessData(faults = "NOC")
# Select the data under state 1
data <- nrml[nrml[,1] == 1]

faultFilter(trainData = data[1:672, -1],
            testData = data[673:3360, -1],
            updateFreq = 336)




