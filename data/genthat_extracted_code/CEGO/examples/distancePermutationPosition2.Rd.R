library(CEGO)


### Name: distancePermutationPosition2
### Title: Squared Position Distance for Permutations
### Aliases: distancePermutationPosition2

### ** Examples

x <- 1:5
y <- c(1,3,5,4,2)
distancePermutationPosition2(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationPosition2)




