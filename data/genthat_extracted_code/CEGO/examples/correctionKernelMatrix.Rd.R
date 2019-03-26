library(CEGO)


### Name: correctionKernelMatrix
### Title: Correction of a Kernel (Correlation) Matrix
### Aliases: correctionKernelMatrix

### ** Examples

x <- list(c(2,1,4,3),c(2,4,3,1),c(4,2,1,3),c(4,3,2,1),c(1,4,3,2))
D <- distanceMatrix(x,distancePermutationInsert)
K <- exp(-0.01*D)
is.PSD(K) #matrix should not be PSD
K <- correctionKernelMatrix(K)$mat
is.PSD(K) #matrix should now be CNSD
K



