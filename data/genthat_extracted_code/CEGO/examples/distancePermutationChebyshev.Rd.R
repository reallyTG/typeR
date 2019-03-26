library(CEGO)


### Name: distancePermutationChebyshev
### Title: Chebyshev Distance for Permutations
### Aliases: distancePermutationChebyshev

### ** Examples

x <- 1:5
y <- c(5,1,2,3,4)
distancePermutationChebyshev(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationChebyshev)




