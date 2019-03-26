library(sdcMicro)


### Name: localSuppression
### Title: Local Suppression to obtain k-anonymity
### Aliases: localSuppression kAnon
### Keywords: manip

### ** Examples

data(francdat)
## Local Suppression
localS <- localSuppression(francdat, keyVar=c(4,5,6))
localS
plot(localS)
## Not run: 
##D ## for objects of class sdcMicro, no stratification
##D data(testdata2)
##D sdc <- createSdcObj(testdata2,
##D   keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
##D   numVars=c('expend','income','savings'), w='sampling_weight')
##D sdc <- localSuppression(sdc)
##D 
##D ## for objects of class sdcMicro, no with stratification
##D testdata2$ageG <- cut(testdata2$age, 5, labels=paste0("AG",1:5))
##D sdc <- createSdcObj(testdata2,
##D   keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
##D   numVars=c('expend','income','savings'), w='sampling_weight',
##D   strataVar='ageG')
##D sdc <- localSuppression(sdc)
##D 
##D ## it is also possible to provide k-anonymity for subsets of key-variables
##D ## with different parameter k!
##D ## in this case we want to provide 10-anonymity for all combinations
##D ## of 5 key variables, 20-anonymity for all combinations with 4 key variables
##D ## and 30-anonymity for all combinations of 3 key variables.
##D ## note: stratas are automatically considered!
##D combs <- 5:3
##D k <- c(10,20,30)
##D sdc <- localSuppression(sdc, k=k, combs=combs)
##D 
##D ## data.frame method (no stratification)
##D keyVars <- c("urbrur","roof","walls","water","electcon","relat","sex")
##D strataVars <- c("ageG")
##D inp <- testdata2[,c(keyVars, strataVars)]
##D ls <- localSuppression(inp, keyVars=1:7)
##D print(ls)
##D plot(ls)
##D 
##D ## data.frame method (with stratification)
##D ls <- kAnon(inp, keyVars=1:7, strataVars=8)
##D print(ls)
##D plot(ls, showTotalSupps=TRUE)
## End(Not run)



