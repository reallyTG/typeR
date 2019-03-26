library(CEGO)


### Name: distancePermutationR
### Title: R-Distance for Permutations
### Aliases: distancePermutationR

### ** Examples

x <- 1:5
y <- c(1,2,3,5,4)
distancePermutationR(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationR)




