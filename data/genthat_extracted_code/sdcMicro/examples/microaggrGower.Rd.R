library(sdcMicro)


### Name: microaggrGower
### Title: Microaggregation for numerical and categorical key variables
###   based on a distance similar to the Gower Distance
### Aliases: microaggrGower

### ** Examples


data(testdata,package="sdcMicro")
testdata <- testdata[1:200,]
for(i in c(1:7,9)) testdata[,i] <- as.factor(testdata[,i])
test <- microaggrGower(testdata,variables=c("relat","age","expend"),
  dist_var=c("age","sex","income","savings"),by=c("urbrur","roof"))

sdc <- createSdcObj(testdata,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')

sdc <- microaggrGower(sdc)



