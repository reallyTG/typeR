library(qkerntool)


### Name: as.qkernmatrix
### Title: Assing qkernmatrix class to matrix objects
### Aliases: qkernmatrix-class as.qkernmatrix as.qkernmatrix-methods
###   as.qkernmatrix,matrix-method
### Keywords: methods

### ** Examples

## Create the data
x <- rbind(matrix(rnorm(10),,2),matrix(rnorm(10,mean=3),,2))
y <- matrix(c(rep(1,5),rep(-1,5)))

### Use as.qkernmatrix to label the cov. matrix as a qkernel matrix
### which is eq. to using a linear kernel

K <- as.qkernmatrix(crossprod(t(x)))

K





