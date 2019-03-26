library(sdcMicro)


### Name: groupAndRename
### Title: Join levels of a variables in an object of class
###   'sdcMicroObj-class' or 'factor' or 'data.frame'
### Aliases: groupAndRename
### Keywords: methods

### ** Examples

## for objects of class sdcMicro:
data(testdata2)
testdata2$urbrur <- as.factor(testdata2$urbrur)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- groupAndRename(sdc, var="urbrur", before=c("1","2"), after=c("1"))



