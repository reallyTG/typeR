library(sdcMicro)


### Name: print.sdcMicroObj
### Title: Print and Extractor Functions for objects of class
###   'sdcMicroObj-class'
### Aliases: print.sdcMicroObj print,sdcMicroObj-method
### Keywords: classes

### ** Examples

data(testdata)
sdc <- createSdcObj(testdata,
  keyVars=c('urbrur','roof','walls','relat','sex'),
  pramVars=c('water','electcon'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- microaggregation(sdc, method="mdav", aggr=3)
print(sdc)
print(sdc, type="general")
print(sdc, type="ls")
print(sdc, type="recode")
print(sdc, type="risk")
print(sdc, type="numrisk")
print(sdc, type="pram")
print(sdc, type="kAnon")
print(sdc, type="comp_numvars")



