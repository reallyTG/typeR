library(CEGO)


### Name: nearCNSD
### Title: Nearest CNSD matrix
### Aliases: nearCNSD

### ** Examples

# example using Insert distance with permutations:
x <- list(c(2,1,4,3),c(2,4,3,1),c(4,2,1,3),c(4,3,2,1),c(1,4,3,2))
D <- distanceMatrix(x,distancePermutationInsert)
print(D)
is.CNSD(D)
nearD <- nearCNSD(D)
print(nearD)
is.CNSD(nearD$mat)
# or example matrix from Glunt et al. (1990):
D <- matrix(c(0,1,1,1,0,9,1,9,0),3,3)
print(D)
is.CNSD(D)
nearD <- nearCNSD(D)
print(nearD)
is.CNSD(nearD$mat)
# note, that the resulting values given by Glunt et al. (1990) are 19/9 and 76/9



