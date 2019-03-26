library(classyfire)


### Name: cfPermute
### Title: Permutation testing to indicate statistical significance of
###   performance
### Aliases: cfPermute
### Keywords: nonparametric models

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
##D # Execute 5 permutation rounds; in each permutation test, an ensemble of 20 classifiers 
##D # is constructed, each running 10 bootstrap iterations during the optimization process
##D # The default values for permutation testing are ensNum = bootNum = permNum = 100
##D 
##D permObj <- cfPermute(irisData, irisClass, bootNum = 10, ensNum = 20, permNum = 5, parallel = TRUE, 
##D                      cpus = 4, type = "SOCK")
##D 
##D # List of attributes for each permutation
##D attributes(permObj)
##D 
##D # Get the vector of averaged accuracies, one for each permutation 
##D # (each permutation is an independent classification ensemble)
##D permObj$avgAcc
##D 
##D # Get the overall elapsed time for the permutation process 
##D permObj$totalTime[3]
##D 
##D # Get the vector of individual execution times for each permutation
##D permObj$execTime
##D 
##D # Access the first ensemble in the permutation list
##D permObj$permList[[1]]
## End(Not run)



