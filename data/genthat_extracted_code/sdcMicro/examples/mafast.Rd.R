library(sdcMicro)


### Name: mafast
### Title: Fast and Simple Microaggregation
### Aliases: mafast
### Keywords: manip

### ** Examples

data(Tarragona)
m1 <- mafast(Tarragona, variables=c("GROSS.PROFIT","OPERATING.PROFIT","SALES"),aggr=3)
data(testdata)
m2 <- mafast(testdata,variables=c("expend","income","savings"),aggr=50,by="sex")
summary(m2)

## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- dRisk(sdc)
sdc@risk$numeric
sdc1 <- mafast(sdc,aggr=4)
sdc1@risk$numeric

sdc2 <- mafast(sdc,aggr=10)
sdc2@risk$numeric
## Not run: 
##D ### Performance tests
##D x <- testdata
##D for(i in 1:20){
##D   x <- rbind(x,testdata)
##D }
##D system.time(xx <- mafast(x,variables=c("expend","income","savings"),aggr=50,by="sex"))
## End(Not run)




