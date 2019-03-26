library(sdcMicro)


### Name: set.sdcMicroObj
### Title: set.sdcMicroObj
### Aliases: set.sdcMicroObj

### ** Examples

sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
ind_pram <- match(c("sex"), colnames(testdata2))
get.sdcMicroObj(sdc, type="pramVars")
sdc <- set.sdcMicroObj(sdc, type="pramVars", input=list(ind_pram))
get.sdcMicroObj(sdc, type="pramVars")



