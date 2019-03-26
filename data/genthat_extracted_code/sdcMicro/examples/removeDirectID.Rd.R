library(sdcMicro)


### Name: removeDirectID
### Title: Remove certain variables from the data set inside a sdc object.
### Aliases: removeDirectID
### Keywords: methods

### ** Examples

## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata, keyVars=c('urbrur','roof'),
 numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- removeDirectID(sdc, var="age")



