library(CEGO)


### Name: distancePermutationPosition
### Title: Position Distance for Permutations
### Aliases: distancePermutationPosition

### ** Examples

x <- 1:5
y <- c(1,3,5,4,2)
distancePermutationPosition(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationPosition)




