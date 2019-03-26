library(rARPACK)


### Name: eigs
### Title: Find a Specified Number of Eigenvalues/vectors for Square Matrix
### Aliases: eigs eigs_sym
### Keywords: array

### ** Examples

library(Matrix)
n = 20
k = 5

## general matrices have complex eigenvalues
set.seed(111)
A1 = matrix(rnorm(n^2), n)  ## class "matrix"
A2 = Matrix(A1)             ## class "dgeMatrix"

eigs(A1, k)
eigs(A2, k, opts = list(retvec = FALSE))  ## eigenvalues only

## sparse matrices
A1[sample(n^2, n^2 / 2)] = 0
A3 = as(A1, "dgCMatrix")
A4 = as(A1, "dgRMatrix")

eigs(A3, k)
eigs(A4, k)

## function interface
f = function(x, args)
{
    as.numeric(args %*% x)
}
eigs(f, k, n = n, args = A3)

## symmetric matrices have real eigenvalues
A5 = crossprod(A1)
eigs_sym(A5, k)

## find the smallest (in absolute value) k eigenvalues of A5
eigs_sym(A5, k, which = "SM")

## another way to do this: use the sigma argument
eigs_sym(A5, k, sigma = 0)

## The results should be the same,
## but the latter method is far more stable on large matrices



