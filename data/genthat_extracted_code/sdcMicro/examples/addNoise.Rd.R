library(sdcMicro)


### Name: addNoise
### Title: Adding noise to perturb data
### Aliases: addNoise
### Keywords: manip

### ** Examples


data(Tarragona)
a1 <- addNoise(Tarragona)
a1

data(testdata)
testdata[, c('expend','income','savings')] <-
addNoise(testdata[,c('expend','income','savings')])$xm

## for objects of class sdcMicroObj:
data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- addNoise(sdc)



