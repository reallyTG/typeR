library(CEGO)


### Name: distancePermutationLevenshtein
### Title: Levenshtein Distance for Permutations
### Aliases: distancePermutationLevenshtein

### ** Examples

x <- 1:5
y <- c(1,2,5,4,3)
distancePermutationLevenshtein(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationLevenshtein)




