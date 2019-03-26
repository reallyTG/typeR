library(CEGO)


### Name: distancePermutationManhattan
### Title: Manhattan Distance for Permutations
### Aliases: distancePermutationManhattan

### ** Examples

x <- 1:5
y <- c(5,1,2,3,4)
distancePermutationManhattan(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationManhattan)




