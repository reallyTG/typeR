library(classyfire)


### Name: getAvgAcc
### Title: Get the average accuracies of a classification ensemble
### Aliases: getAvgAcc
### Keywords: array

### ** Examples

## Not run: 
##D data(iris)
##D 
##D irisClass <- iris[,5]
##D irisData  <- iris[,-5]
##D 
##D ens <- cfBuild(inputData = irisData, inputClass = irisClass, bootNum = 100, 
##D                ensNum = 100, parallel = TRUE, cpus = 4, type = "SOCK")
##D 
##D # Get the attributes provided by the getAvgAcc function
##D attributes(getAvgAcc(ens))
##D 
##D # Get the average test and train accuracies within the ensemble
##D getAvgAcc(ens)
##D 
##D # Get the average test accuracy 
##D getAvgAcc(ens)$Test
##D 
##D # Get the average train accuracy
##D getAvgAcc(ens)$Train
## End(Not run)



