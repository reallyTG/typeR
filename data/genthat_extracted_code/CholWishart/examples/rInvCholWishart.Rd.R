library(CholWishart)


### Name: rInvCholWishart
### Title: Cholesky Factor of Random Inverse Wishart Distributed Matrices
### Aliases: rInvCholWishart

### ** Examples

# How it is parameterized:
set.seed(20180211)
A <- rCholWishart(1,10,3*diag(5))[,,1]
A
set.seed(20180211)
B <- rInvCholWishart(1,10,1/3*diag(5))[,,1]
B
crossprod(A) %*% crossprod(B)

set.seed(20180211)
C <- chol(stats::rWishart(1,10,3*diag(5))[,,1])
C



