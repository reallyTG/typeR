library(CEGO)


### Name: distancePermutationLex
### Title: Lexicographic permutation distance
### Aliases: distancePermutationLex

### ** Examples

x <- 1:5
y <- c(1,2,3,5,4)
distancePermutationLex(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationLex)




