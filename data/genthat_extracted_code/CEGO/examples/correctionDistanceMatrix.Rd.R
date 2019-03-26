library(CEGO)


### Name: correctionDistanceMatrix
### Title: Correction of a Distance Matrix
### Aliases: correctionDistanceMatrix

### ** Examples

x <- list(c(2,1,4,3),c(2,4,3,1),c(4,2,1,3),c(4,3,2,1),c(1,4,3,2))
D <- distanceMatrix(x,distancePermutationInsert)
is.CNSD(D) #matrix should not be CNSD
D <- correctionDistanceMatrix(D)$mat
is.CNSD(D) #matrix should now be CNSD
D



