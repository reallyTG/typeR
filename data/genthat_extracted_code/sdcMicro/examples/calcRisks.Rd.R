library(sdcMicro)


### Name: calcRisks
### Title: Recompute Risk and Frequencies for a sdcMicroObj
### Aliases: calcRisks

### ** Examples

data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- calcRisks(sdc)




