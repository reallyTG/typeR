library(sdcMicro)


### Name: riskyCells
### Title: riskyCells
### Aliases: riskyCells
### Keywords: manip

### ** Examples

## Not run: 
##D ## data.frame method / all combinations up to maxDim
##D riskyCells(testdata2, keyVars=c(1:5), threshold=c(50,25,10,5),
##D   useIdentificationLevel=FALSE, maxDim=4)
##D riskyCells(testdata2, keyVars=c(1:5), threshold=10,
##D   useIdentificationLevel=FALSE, maxDim=3)
##D 
##D ## data.frame method / using identification levels
##D riskyCells(testdata2, keyVars=c(1:6), threshold=20,
##D   useIdentificationLevel=TRUE, level=c(1,1,2,3,3,5))
##D riskyCells(testdata2, keyVars=c(1,3,4,6), threshold=10,
##D   useIdentificationLevel=TRUE, level=c(1,2,2,4))
##D 
##D ## sdcMicroObj-method / all combinations up to maxDim
##D testdata2[1:6] <- lapply(1:6, function(x) {
##D   testdata2[[x]] <- as.factor(testdata2[[x]])
##D })
##D sdc <- createSdcObj(testdata2,
##D   keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
##D   numVars=c('expend','income','savings'), w='sampling_weight')
##D 
##D r0 <- riskyCells(sdc, useIdentificationLevel=FALSE, threshold=c(20,10,5), maxDim=3)
##D ## in case key-variables have been modified, we get counts for original and modified data
##D sdc <- groupAndRename(sdc, var="roof", before=c("5","6","9"), after=c("5+"))
##D r1 <- riskyCells(sdc, useIdentificationLevel=FALSE, threshold=c(10,5,3), maxDim=3)
##D 
##D ## sdcMicroObj-method / using identification levels
##D riskyCells(sdc, useIdentificationLevel=TRUE, threshold=10, level=c(c(1,1,3,4,5,5,5)))
## End(Not run)



