library(CEGO)


### Name: distancePermutationSwap
### Title: Swap-Distance for Permutations
### Aliases: distancePermutationSwap

### ** Examples

x <- 1:5
y <- c(1,2,3,5,4)
distancePermutationSwap(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationSwap)




