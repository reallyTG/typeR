library(CEGO)


### Name: repairConditionsDistanceMatrix
### Title: Repair Conditions of a Distance Matrix
### Aliases: repairConditionsDistanceMatrix

### ** Examples

x <- list(c(2,1,4,3),c(2,4,3,1),c(4,2,1,3),c(4,3,2,1),c(1,4,3,2))
D <- distanceMatrix(x,distancePermutationInsert)
D <- correctionCNSD(D)
D
D <- repairConditionsDistanceMatrix(D)
D



