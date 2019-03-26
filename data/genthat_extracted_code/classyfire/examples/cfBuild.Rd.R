library(classyfire)


### Name: cfBuild
### Title: Create a highly optimised ensemble of RBF SVM classifiers
### Aliases: cfBuild cfBuild.default
### Keywords: classif multivariate models nonlinear optimize

### ** Examples

## Not run: 
##D data(iris)
##D 
##D irisClass <- iris[,5]
##D irisData  <- iris[,-5]
##D 
##D # Construct a classification ensemble with 100 classifiers and 100 bootstrap 
##D # iterations during optimisation
##D 
##D ens <- cfBuild(inputData = irisData, inputClass = irisClass, bootNum = 100, 
##D                ensNum = 100, parallel = TRUE, cpus = 4, type = "SOCK")
##D 
##D # List of attributes available for each classifier in the ensemble
##D attributes(ens)
##D 
##D # Get the overall average test and train accuracy
##D getAvgAcc(ens)$Test
##D getAvgAcc(ens)$Train
##D 
##D # Get all the individual test and train accuracies in the ensemble
##D ens$testAcc    # alternatively, getAcc(ens)$Test
##D ens$trainAcc   # alternatively, getAcc(ens)$Train
## End(Not run)



