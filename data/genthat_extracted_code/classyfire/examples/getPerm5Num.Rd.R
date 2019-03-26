library(classyfire)


### Name: getPerm5Num
### Title: Get descriptive statistics from a permutation object
### Aliases: getPerm5Num
### Keywords: math

### ** Examples

## Not run: 
##D data(iris)
##D 
##D irisClass <- iris[,5]
##D irisData  <- iris[,-5]
##D 
##D permObj <- cfPermute(irisData, irisClass, bootNum = 10, ensNum = 20, permNum = 5, 
##D                      parallel = TRUE, cpus = 4, type = "SOCK")
##D 
##D getPerm5Num(permObj)
##D getPerm5Num(permObj)$median      
##D getPerm5Num(permObj)$minimum
##D getPerm5Num(permObj)$maximum
##D getPerm5Num(permObj)$upperQ
##D getPerm5Num(permObj)$lowerQ
## End(Not run)



