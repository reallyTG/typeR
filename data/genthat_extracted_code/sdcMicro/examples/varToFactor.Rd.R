library(sdcMicro)


### Name: varToFactor
### Title: Change the a keyVariable of an object of class
###   'sdcMicroObj-class' from Numeric to Factor or from Factor to Numeric
### Aliases: varToFactor varToNumeric
### Keywords: methods

### ** Examples

## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- varToFactor(sdc, var="urbrur")




