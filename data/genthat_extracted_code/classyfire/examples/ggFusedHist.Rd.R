library(classyfire)


### Name: ggFusedHist
### Title: Fused histograms of ensemble and permutation results
### Aliases: ggFusedHist
### Keywords: hplot

### ** Examples

## Not run: 
##D data(iris)
##D 
##D irisClass <- iris[,5]
##D irisData  <- iris[,-5]
##D                
##D # ** Use parallel = FALSE for execution in sequence **
##D 
##D # Ensemble construction
##D ensObj  <- cfBuild(inputData = irisData, inputClass = irisClass, bootNum = 5, 
##D                    ensNum = 2, parallel = FALSE)
##D 
##D # Permutation test
##D permObj <- cfPermute(irisData, irisClass, bootNum = 5, ensNum = 2, permNum = 2, 
##D                      parallel = FALSE)
##D 
##D ggFusedHist(ensObj, permObj)
## End(Not run)



