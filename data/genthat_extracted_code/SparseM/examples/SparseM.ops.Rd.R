library(SparseM)


### Name: SparseM.ops
### Title: Basic Linear Algebra for Sparse Matrices
### Aliases: Ops.matrix.csr Ops.matrix.diag.csr %*%-methods
###   %*%,ANY,ANY-method %*%,matrix.csr,matrix.csr-method
###   %*%,matrix.csr,matrix-method %*%,matrix.csr,numeric-method
###   %*%,matrix,matrix.csr-method %*%,numeric,matrix.csr-method
###   kronecker-methods kronecker,matrix.csr,matrix.csr-method
###   kronecker,matrix.csr,matrix-method
###   kronecker,matrix.csr,numeric-method
###   kronecker,matrix,matrix.csr-method
###   kronecker,numeric,matrix.csr-method +,matrix.csr-method
###   -,matrix.csr-method *,matrix.csr-method /,matrix.csr-method
###   ^,matrix.csr-method %%,matrix.csr-method %/%,matrix.csr-method
###   >,matrix.csr-method >=,matrix.csr-method <,matrix.csr-method
###   <=,matrix.csr-method ==,matrix.csr-method !=,matrix.csr-method
###   &,matrix.csr-method |,matrix.csr-method norm norm,ANY-method
###   norm,matrix.csr-method norm,matrix.csr,character-method
###   norm,matrix.csr,missing-method det,ANY-method det,matrix-method
###   det,matrix.csr-method det,matrix.csr.chol-method
###   determinant,matrix.csr.chol,missing-method
###   determinant,matrix.csr.chol,logical-method
###   determinant,matrix.csr,missing-method
###   determinant,matrix.csr,logical-method t,ANY-method
###   t,matrix.csr-method t,matrix.csc-method t,matrix.coo-method
###   diag,ANY-method diag,matrix.csr-method diag<-,ANY-method
###   diag<-,matrix.csr-method diag<-,matrix.diag.csr-method
###   diff,matrix.csr-method diff<-,ANY-method diff<-,matrix.csr-method
###   diag.assign,matrix.csr-method ncol,matrix.csr-method
###   nrow,matrix.csr-method dim,ANY-method dim,matrix.csr-method
###   dim,matrix.csc-method dim,matrix.ssr-method dim,matrix.ssc-method
###   dim,matrix.coo-method rbind.matrix.csr cbind.matrix.csr [.matrix.csr
###   [.matrix.diag.csr [<-.matrix.csr [<-.matrix.diag.csr [.matrix.coo
###   [<-.matrix.coo
### Keywords: algebra

### ** Examples

n1 <- 10
n2 <- 10
p <- 6
y <- rnorm(n1)
a <- rnorm(n1*p)
a[abs(a) < 0.5] <- 0
A <- matrix(a,n1,p)
A.csr <- as.matrix.csr(A)
b <- rnorm(n2*p)
b[abs(b)<1.0] <- 0
B <- matrix(b,n2,p)
B.csr <- as.matrix.csr(B)

# matrix transposition and multiplication
A.csr%*%t(B.csr)

# kronecker product - via kronecker() methods:
A.csr %x% matrix(1:4,2,2)



