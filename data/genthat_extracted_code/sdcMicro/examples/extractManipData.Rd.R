library(sdcMicro)


### Name: extractManipData
### Title: Remove certain variables from the data set inside a sdc object.
### Aliases: extractManipData

### ** Examples

## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata,
  keyVars=c('urbrur','roof'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- removeDirectID(sdc, var="age")
dataM <- extractManipData(sdc)



