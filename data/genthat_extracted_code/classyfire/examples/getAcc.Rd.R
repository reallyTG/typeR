library(classyfire)


### Name: getAcc
### Title: Get the accuracies of a classification ensemble
### Aliases: getAcc
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
##D # Get the attributes provided by the getAcc function
##D attributes(getAcc(ens))
##D 
##D # Get both the vectors of test and train accuracies from the classifiers in the ensemble
##D getAcc(ens)
##D 
##D # Get the vector of test accuracies from the classifiers in the ensemble
##D getAcc(ens)$Test
##D 
##D # Get the vector of train accuracies from the classifiers in the ensemble
##D getAcc(ens)$Train
## End(Not run)



