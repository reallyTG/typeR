library(matlib)


### Name: GramSchmidt
### Title: Gram-Schmidt Orthogonalization of a Matrix
### Aliases: GramSchmidt

### ** Examples

(xx <- matrix(c( 1:3, 3:1, 1, 0, -2), 3, 3))
crossprod(xx)
(zz <- GramSchmidt(xx, normalize=FALSE))
zapsmall(crossprod(zz))

# normalized
(zz <- GramSchmidt(xx))
zapsmall(crossprod(zz))

# print steps
GramSchmidt(xx, verbose=TRUE)

# non-invertible matrix; hence, its basis is not orthonormal
(xx <- matrix(c( 1:3, 3:1, 1, 0, -1), 3, 3))
crossprod(xx)
(zz <- GramSchmidt(xx))
zapsmall(crossprod(zz))




