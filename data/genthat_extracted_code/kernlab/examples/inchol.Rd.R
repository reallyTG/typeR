library(kernlab)


### Name: inchol
### Title: Incomplete Cholesky decomposition
### Aliases: inchol inchol,matrix-method
### Keywords: methods algebra array

### ** Examples


data(iris)
datamatrix <- as.matrix(iris[,-5])
# initialize kernel function
rbf <- rbfdot(sigma=0.1)
rbf
Z <- inchol(datamatrix,kernel=rbf)
dim(Z)
pivots(Z)
# calculate kernel matrix
K <- crossprod(t(Z))
# difference between approximated and real kernel matrix
(K - kernelMatrix(kernel=rbf, datamatrix))[6,]




