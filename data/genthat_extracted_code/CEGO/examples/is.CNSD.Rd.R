library(CEGO)


### Name: is.CNSD
### Title: Check for Conditional Negative Semi-Definiteness
### Aliases: is.CNSD

### ** Examples

# The following permutations will produce
# a non-CNSD distance matrix with Insert distance
# and a CNSD distance matrix with Hamming distance
x <- list(c(2,1,4,3),c(2,4,3,1),c(4,2,1,3),c(4,3,2,1),c(1,4,3,2))
D <- distanceMatrix(x,distancePermutationInsert)
is.CNSD(D,"alg1")
is.CNSD(D,"alg2")
is.CNSD(D,"eucl")
D <- distanceMatrix(x,distancePermutationHamming)
is.CNSD(D,"alg1")
is.CNSD(D,"alg2")
is.CNSD(D,"eucl")



