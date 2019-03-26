library(COMBIA)


### Name: removeOutliers
### Title: This function Remove Outliers
### Aliases: removeOutliers

### ** Examples

dataFile <- system.file("extdata", "rawDataPreProcessed.csv", package="COMBIA")
dataSample <- read.csv(dataFile, header=FALSE )
minThersholdForCV <- 0.3
minThersholdForCVCal <- 0.1
removeOutliers( as.matrix(dataSample ), minThersholdForCV,
       minThersholdForCVCal) 



