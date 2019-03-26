library(NNS)


### Name: NNS.stack
### Title: NNS stack
### Aliases: NNS.stack
### Keywords: classifier

### ** Examples

 ## Using 'iris' dataset where test set [IVs.test] is 'iris' rows 141:150.
 ## Not run: 
##D  NNS.stack(iris[1:140, 1:4], iris[1:140, 5], IVs.test = iris[141:150, 1:4])
## End(Not run)

 ## Using 'iris' dataset to determine [n.best] and [threshold] with no test set.
 ## Not run: 
##D  NNS.stack(iris[ , 1:4], iris[ , 5])
## End(Not run)

 ## Selecting NNS.reg and dimension reduction techniques.
 ## Not run: 
##D  NNS.stack(iris[1:140, 1:4], iris[1:140, 5], iris[141:150, 1:4], method = c(1, 2))
## End(Not run)



