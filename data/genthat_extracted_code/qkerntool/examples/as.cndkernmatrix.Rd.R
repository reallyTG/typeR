library(qkerntool)


### Name: as.cndkernmatrix
### Title: Assing cndkernmatrix class to matrix objects
### Aliases: cndkernmatrix-class as.cndkernmatrix as.cndkernmatrix-methods
###   as.cndkernmatrix,matrix-method
### Keywords: methods

### ** Examples

## Create the data
x <- rbind(matrix(rnorm(10),,2),matrix(rnorm(10,mean=3),,2))
y <- matrix(c(rep(1,5),rep(-1,5)))

### Use as.cndkernmatrix to label the cov. matrix as a CND kernel matrix
### which is eq. to using a linear kernel

K <- as.cndkernmatrix(crossprod(t(x)))

K





