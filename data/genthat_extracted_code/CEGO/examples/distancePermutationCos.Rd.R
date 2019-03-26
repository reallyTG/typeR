library(CEGO)


### Name: distancePermutationCos
### Title: Cosine Distance for Permutations
### Aliases: distancePermutationCos

### ** Examples

x <- 1:5
y <- c(5,1,2,3,4)
distancePermutationCos(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationCos)




