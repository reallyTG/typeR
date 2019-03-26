library(CEGO)


### Name: distanceMatrixWrapper
### Title: Distance Matrix Wrapper
### Aliases: distanceMatrixWrapper
### Keywords: internal

### ** Examples

x <- list(5:1,c(2,4,5,1,3),c(5,4,3,1,2))
dm1 <- distanceMatrix(x,distancePermutationHamming)
dm2 <- distanceMatrix(x,distancePermutationInsert)
dmBoth <- distanceMatrixWrapper(x,list(distancePermutationHamming,distancePermutationInsert))




