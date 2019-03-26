library(CEGO)


### Name: distancePermutationEuclidean
### Title: Euclidean Distance for Permutations
### Aliases: distancePermutationEuclidean

### ** Examples

x <- 1:5
y <- c(5,1,2,3,4)
distancePermutationEuclidean(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationEuclidean)




