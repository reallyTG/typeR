library(kernlab)


### Name: csi-class
### Title: Class "csi"
### Aliases: csi-class Q R predgain truegain diagresidues,csi-method
###   maxresiduals,csi-method pivots,csi-method predgain,csi-method
###   truegain,csi-method Q,csi-method R,csi-method
### Keywords: classes

### ** Examples

data(iris)

## create multidimensional y matrix
yind <- t(matrix(1:3,3,150))
ymat <- matrix(0, 150, 3)
ymat[yind==as.integer(iris[,5])] <- 1

datamatrix <- as.matrix(iris[,-5])
# initialize kernel function
rbf <- rbfdot(sigma=0.1)
rbf
Z <- csi(datamatrix,ymat, kernel=rbf, rank = 30)
dim(Z)
pivots(Z)
# calculate kernel matrix
K <- crossprod(t(Z))
# difference between approximated and real kernel matrix
(K - kernelMatrix(kernel=rbf, datamatrix))[6,]




