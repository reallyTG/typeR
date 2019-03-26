library(sdcMicro)


### Name: microaggregation
### Title: Microaggregation
### Aliases: microaggregation
### Keywords: manip

### ** Examples

data(Tarragona)
m1 <- microaggregation(Tarragona, method='onedims', aggr=3)
## summary(m1)
data(testdata)
m2 <- microaggregation(testdata[1:100,c('expend','income','savings')],
  method='mdav', aggr=4)
summary(m2)

## for objects of class sdcMicro:
## no stratification because @strataVar is NULL
data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- microaggregation(sdc, variables=c("expend","income"))

## with stratification by 'relat'
strataVar(sdc) <- "relat"
sdc <- microaggregation(sdc, variables=c("savings"))



