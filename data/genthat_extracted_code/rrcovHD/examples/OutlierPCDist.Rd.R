library(rrcovHD)


### Name: OutlierPCDist
### Title: Outlier identification in high dimensions using the PCDIST
###   algorithm
### Aliases: OutlierPCDist OutlierPCDist.formula OutlierPCDist.default
### Keywords: robust multivariate

### ** Examples


data(hemophilia)
obj <- OutlierPCDist(gr~.,data=hemophilia)
obj

getDistance(obj)            # returns an array of distances
getClassLabels(obj, 1)      # returns an array of indices for a given class
getCutoff(obj)              # returns an array of cutoff values (for each class, usually equal)
getFlag(obj)                #  returns an 0/1 array of flags
plot(obj, class=2)          # standard plot function



