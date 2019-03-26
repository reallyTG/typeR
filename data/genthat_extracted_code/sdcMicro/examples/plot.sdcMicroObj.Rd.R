library(sdcMicro)


### Name: plot.sdcMicroObj
### Title: Plotfunctions for objects of class 'sdcMicroObj-class'
### Aliases: plot.sdcMicroObj
### Keywords: classes

### ** Examples


data(testdata)
sdc <- createSdcObj(testdata,
  keyVars=c('urbrur','roof','walls','relat','sex'),
  pramVars=c('water','electcon'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- kAnon(sdc, k=5)
plot(sdc, type="ls")




