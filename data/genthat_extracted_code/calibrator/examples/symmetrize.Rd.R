library(calibrator)


### Name: symmetrize
### Title: Symmetrize an upper triangular matrix
### Aliases: symmetrize
### Keywords: array

### ** Examples

jj <- matrix(rnorm(50),10,5)
X <- crossprod(jj,jj)    # X has a Wishart distribution (and in
                         # particular is positive definite)

chol(X)
symmetrize(chol(X))



