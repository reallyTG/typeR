library(CEGO)


### Name: kernelMatrix
### Title: Calculate Kernel Matrix
### Aliases: kernelMatrix

### ** Examples

x <- list(5:1,c(2,4,5,1,3),c(5,4,3,1,2), sample(5))
kernFun <- function(x,y){
		exp(-distancePermutationHamming(x,y))
}
kernelMatrix(x,distancePermutationHamming)




