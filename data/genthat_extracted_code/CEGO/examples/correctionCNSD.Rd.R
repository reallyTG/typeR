library(CEGO)


### Name: correctionCNSD
### Title: Correcting Conditional Negative Semi-Definiteness
### Aliases: correctionCNSD

### ** Examples

x <- list(c(2,1,4,3),c(2,4,3,1),c(4,2,1,3),c(4,3,2,1),c(1,4,3,2))
D <- distanceMatrix(x,distancePermutationInsert)
is.CNSD(D) #matrix should not be CNSD
D <- correctionCNSD(D)
is.CNSD(D) #matrix should now be CNSD
D
# note: to fix the negative distances, use repairConditionsDistanceMatrix. 
# Or else, use correctionDistanceMatrix.



