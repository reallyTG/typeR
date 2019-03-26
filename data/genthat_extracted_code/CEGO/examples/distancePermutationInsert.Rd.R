library(CEGO)


### Name: distancePermutationInsert
### Title: Insert Distance for Permutations
### Aliases: distancePermutationInsert

### ** Examples

x <- 1:5
y <- c(5,1,2,3,4)
distancePermutationInsert(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationInsert)




