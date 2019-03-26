library(CEGO)


### Name: repairConditionsCorrelationMatrix
### Title: Repair Conditions of a Correlation Matrix
### Aliases: repairConditionsCorrelationMatrix

### ** Examples

x <- list(c(2,1,4,3),c(2,4,3,1),c(4,2,1,3),c(4,3,2,1),c(1,4,3,2))
D <- distanceMatrix(x,distancePermutationInsert)
K <- exp(-0.01*D)
K <- correctionDefinite(K,type="PSD")$mat
K
K <- repairConditionsCorrelationMatrix(K)



