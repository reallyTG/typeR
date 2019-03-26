library(RSpectra)


### Name: svds
### Title: Find the Largest k Singular Values/Vectors of a Matrix
### Aliases: svds svds.matrix svds.dgeMatrix svds.dgCMatrix svds.dgRMatrix
###   svds.dsyMatrix svds.function
### Keywords: array

### ** Examples

m = 100
n = 20
k = 5
set.seed(111)
A = matrix(rnorm(m * n), m)

svds(A, k)
svds(t(A), k, nu = 0, nv = 3)

## Sparse matrices
library(Matrix)
A[sample(m * n, m * n / 2)] = 0
Asp1 = as(A, "dgCMatrix")
Asp2 = as(A, "dgRMatrix")

svds(Asp1, k)
svds(Asp2, k, nu = 0, nv = 0)

## Function interface
Af = function(x, args)
{
    as.numeric(args %*% x)
}

Atf = function(x, args)
{
    as.numeric(crossprod(args, x))
}

svds(Af, k, Atrans = Atf, dim = c(m, n), args = Asp1)




