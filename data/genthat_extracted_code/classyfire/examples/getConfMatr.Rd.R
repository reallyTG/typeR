library(classyfire)


### Name: getConfMatr
### Title: Confusion matrix summarising the performance of an ensemble
### Aliases: getConfMatr
### Keywords: array

### ** Examples

## Not run: 
##D data(iris)
##D 
##D irisClass <- iris[,5]
##D irisData  <- iris[,-5]
##D             
##D ens <- cfBuild(irisData, irisClass, bootNum = 100, ensNum = 100, parallel = TRUE, 
##D                cpus = 4, type = "SOCK")
##D 
##D # Get the confusion matrix summarising the performance of the ensemble
##D getConfMatr(ens)
## End(Not run)



