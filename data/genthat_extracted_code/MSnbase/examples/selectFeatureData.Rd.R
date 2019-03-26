library(MSnbase)


### Name: selectFeatureData
### Title: Select feature variables of interest
### Aliases: selectFeatureData requiredFvarLabels

### ** Examples


library("pRolocdata")
data(hyperLOPIT2015)
## 5 first feature variables
x <- selectFeatureData(hyperLOPIT2015, fcol = 1:5)
fvarLabels(x)
## Not run: 
##D ## select via GUI
##D x <- selectFeatureData(hyperLOPIT2015)
##D fvarLabels(x)
## End(Not run)

## Subset the feature data of an OnDiskMSnExp object to the minimal
## required columns
f <- system.file("microtofq/MM14.mzML", package = "msdata")
od <- readMSData(f, mode = "onDisk")

## what columns do we have?
fvarLabels(od)

## Reduce the feature data data.frame to the required columns only
od <- selectFeatureData(od, fcol = requiredFvarLabels(class(od)))
fvarLabels(od)



