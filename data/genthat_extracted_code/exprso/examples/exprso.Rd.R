library(exprso)


### Name: exprso
### Title: The 'exprso' Package
### Aliases: exprso

### ** Examples

## Not run: 
##D library(exprso)
##D data(iris)
##D array <- exprso(iris[,1:4], iris[,5])
##D arrays <- splitSample(array, percent.include = 67)
##D array.train <- fsANOVA(arrays[[1]], top = 0)
##D array.train <- fsPrcomp(array.train, top = 3)
##D mach <- buildSVM(array.train, top = 5, kernel = "linear", cost = 1)
##D predict(mach, arrays[[2]])
## End(Not run)



