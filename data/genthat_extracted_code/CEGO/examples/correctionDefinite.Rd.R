library(CEGO)


### Name: correctionDefinite
### Title: Correcting Definiteness of a Matrix
### Aliases: correctionDefinite

### ** Examples

x <- list(c(2,1,4,3),c(2,4,3,1),c(4,2,1,3),c(4,3,2,1),c(1,4,3,2))
D <- distanceMatrix(x,distancePermutationInsert)
is.NSD(D) #matrix should not be CNSD
D <- correctionDefinite(D,type="NSD")$mat
is.NSD(D) #matrix should now be CNSD
# different example: PSD kernel
D <- distanceMatrix(x,distancePermutationInsert)
K <- exp(-0.01*D)
is.PSD(K)
K <- correctionDefinite(K,type="PSD")$mat
is.PSD(K)



