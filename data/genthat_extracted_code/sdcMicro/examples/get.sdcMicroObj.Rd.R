library(sdcMicro)


### Name: get.sdcMicroObj
### Title: get.sdcMicroObj
### Aliases: get.sdcMicroObj

### ** Examples

sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sl <- slotNames(sdc)
res <- sapply(sl, function(x) get.sdcMicroObj(sdc, type=x))
str(res)



