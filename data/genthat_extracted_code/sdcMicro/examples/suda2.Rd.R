library(sdcMicro)


### Name: suda2
### Title: Suda2: Detecting Special Uniques
### Aliases: suda2
### Keywords: manip

### ** Examples

## Not run: 
##D data(testdata2)
##D data_suda2 <- suda2(testdata2,variables=c("urbrur","roof","walls","water","sex"))
##D data_suda2
##D str(data_suda2)
##D summary(data_suda2)
##D 
##D ## for objects of class sdcMicro:
##D data(testdata2)
##D sdc <- createSdcObj(testdata2,
##D   keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
##D   numVars=c('expend','income','savings'), w='sampling_weight')
##D sdc <- suda2(sdc, original_scores=FALSE)
## End(Not run)



