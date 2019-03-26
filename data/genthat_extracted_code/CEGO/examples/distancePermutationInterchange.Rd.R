library(CEGO)


### Name: distancePermutationInterchange
### Title: Interchange Distance for Permutations
### Aliases: distancePermutationInterchange

### ** Examples

x <- 1:5
y <- c(1,4,3,2,5)
distancePermutationInterchange(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationInterchange)




