library(mRMRe)


### Name: mRMRe.Filter-class
### Title: Class '"mRMRe.Filter"'
### Aliases: mRMRe.Filter-class mRMR.ensemble mRMR.classic
### Keywords: classes

### ** Examples

showClass("mRMRe.Filter")

set.thread.count(2)

## load data
data(cgps)

## build an mRMRe.Data object
ge <- mRMR.data(data = data.frame(cgps.ge[ , 1:100, drop=FALSE]))

## perform a classic (single) mRMR to select the 10 genes the most correlated with 
## the first gene but the less correlated between each other
exect <- system.time(fs <- new("mRMRe.Filter", data = ge, target_indices = 1,
					levels = c(8, 1, 1, 1, 1)))
print(exect)

## print the index of the selected features for each distinct mRMR solutions
print(solutions(fs)[[1]])

## print the names of the selected features for each distinct mRMR solutions
print(apply(solutions(fs)[[1]], 2, function(x, y) { return(y[x]) }, y=featureNames(ge)))



