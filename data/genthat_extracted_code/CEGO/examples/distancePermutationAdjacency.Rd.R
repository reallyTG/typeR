library(CEGO)


### Name: distancePermutationAdjacency
### Title: Adjacency Distance for Permutations
### Aliases: distancePermutationAdjacency

### ** Examples

x <- 1:5
y <- 5:1
distancePermutationAdjacency(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationAdjacency)




