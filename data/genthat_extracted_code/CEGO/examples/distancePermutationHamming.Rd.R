library(CEGO)


### Name: distancePermutationHamming
### Title: Hamming Distance for Permutations
### Aliases: distancePermutationHamming

### ** Examples

x <- 1:5
y <- c(5,1,2,3,4)
distancePermutationHamming(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationHamming)




