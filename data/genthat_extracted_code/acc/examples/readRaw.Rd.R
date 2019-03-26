library(acc)


### Name: readRaw
### Title: Reads raw data in .csv format for GT3X devices
### Aliases: readRaw
### Keywords: accelerometer

### ** Examples


##
## A example to read counts data
##
## Not run: 
##D # For Vaha-Ypya et al.'s method
##D accData1 <- readRaw("C:/mydata.csv",type='mad')
##D # For Bai et al.'s method with known resting state intensities
##D accData2 <- readRaw("C:/mydata.csv",type='ai',resting=c(.15,.16,.17))
##D # Calculating resting state intensity for Bai et al.'s method
##D restingIntensity <- readRaw("C:/mydata.csv",type='resting')
##D accData3 <- readRaw("C:/mydata.csv",type='ai',resting=restingIntensity)
## End(Not run)





