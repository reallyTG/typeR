library(sdcMicro)


### Name: freq
### Title: Freq
### Aliases: freq

### ** Examples

data(testdata)
sdc <- createSdcObj(testdata,
  keyVars=c('urbrur','roof','walls','relat','sex'),
  pramVars=c('water','electcon'),
  numVars=c('expend','income','savings'), w='sampling_weight')
head(freq(sdc, type="fk"))
head(freq(sdc, type="Fk"))



