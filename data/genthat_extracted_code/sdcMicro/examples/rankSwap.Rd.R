library(sdcMicro)


### Name: rankSwap
### Title: Rank Swapping
### Aliases: rankSwap

### ** Examples

data(testdata2)
data_swap <- rankSwap(testdata2,variables=c("age","income","expend","savings"))

## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- rankSwap(sdc)



