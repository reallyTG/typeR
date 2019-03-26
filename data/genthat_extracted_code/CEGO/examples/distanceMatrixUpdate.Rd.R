library(CEGO)


### Name: distanceMatrixUpdate
### Title: Update distance matrix
### Aliases: distanceMatrixUpdate
### Keywords: internal

### ** Examples

x <- list(5:1,c(2,4,5,1,3),c(5,4,3,1,2))
dm <- distanceMatrix(x,distancePermutationHamming)
x <- append(x,list(1:5))
dmUp <- distanceMatrixUpdate(dm,x,distancePermutationHamming)




