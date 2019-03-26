library(CEGO)


### Name: distancePermutationLee
### Title: Lee Distance for Permutations
### Aliases: distancePermutationLee

### ** Examples

x <- 1:5
y <- c(5,1,2,3,4)
distancePermutationLee(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationLee)




