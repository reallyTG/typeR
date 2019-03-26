library(DATforDCEMRI)


### Name: DAT.checkData
### Title: Create and check data file.
### Aliases: DAT.checkData

### ** Examples

data(DAT.simData, package="DATforDCEMRI")
myccarray <- (DAT.simData$mapCC)
mytimevector <- (DAT.simData$vectorTimes)
myroiarray <- (DAT.simData$maskROI)
myaifvector <- (DAT.simData$vectorAIF)
DAT.checkData(file.name="mydcemridata", vector.times=mytimevector, map.CC=myccarray,
mask.ROI=myroiarray, vector.AIF=myaifvector, slice.stop=2)



