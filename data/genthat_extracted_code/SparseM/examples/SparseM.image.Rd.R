library(SparseM)


### Name: SparseM.image
### Title: Image Plot for Sparse Matrices
### Aliases: image SparseM.image image,matrix.csr-method
### Keywords: hplot algebra

### ** Examples

a <- rnorm(20*5)
A <- matrix(a,20,5)
A[row(A)>col(A)+4|row(A)<col(A)+3] <- 0
b <- rnorm(20*5)
B <- matrix(b,20,5)
B[row(A)>col(A)+2|row(A)<col(A)+2] <- 0
image(as.matrix.csr(A)%*%as.matrix.csr(t(B)))



