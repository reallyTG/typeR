library(CEGO)


### Name: distancePermutationLCStr
### Title: Longest Common Substring Distance for Permutations
### Aliases: distancePermutationLCStr

### ** Examples

x <- 1:5
y <- c(5,1,2,3,4)
distancePermutationLCStr(x,y)
p <- replicate(10,sample(1:5),simplify=FALSE)
distanceMatrix(p,distancePermutationLCStr)




