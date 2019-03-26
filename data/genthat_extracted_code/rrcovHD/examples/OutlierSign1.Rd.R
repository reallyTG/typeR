library(rrcovHD)


### Name: OutlierSign1
### Title: Outlier identification in high dimensions using the SIGN1
###   algorithm
### Aliases: OutlierSign1 OutlierSign1.formula OutlierSign1.default
### Keywords: robust multivariate

### ** Examples


data(hemophilia)
obj <- OutlierSign1(gr~.,data=hemophilia)
obj

getDistance(obj)            # returns an array of distances
getClassLabels(obj, 1)      # returns an array of indices for a given class
getCutoff(obj)              # returns an array of cutoff values (for each class, usually equal)
getFlag(obj)                #  returns an 0/1 array of flags
plot(obj, class=2)          # standard plot function



