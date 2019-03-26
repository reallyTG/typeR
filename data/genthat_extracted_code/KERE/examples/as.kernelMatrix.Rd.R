library(KERE)


### Name: as.kernelMatrix
### Title: Assing kernelMatrix class to matrix objects
### Aliases: kernelMatrix-class as.kernelMatrix as.kernelMatrix-methods
###   as.kernelMatrix,matrix-method
### Keywords: methods

### ** Examples

## Create toy data
x <- rbind(matrix(rnorm(10),,2),matrix(rnorm(10,mean=3),,2))
y <- matrix(c(rep(1,5),rep(-1,5)))

### Use as.kernelMatrix to label the cov. matrix as a kernel matrix
### which is eq. to using a linear kernel 

K <- as.kernelMatrix(crossprod(t(x)))

K




