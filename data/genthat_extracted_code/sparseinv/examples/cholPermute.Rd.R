library(sparseinv)


### Name: cholPermute
### Title: Sparse Cholesky factorisation with fill-in reducing permutations
### Aliases: cholPermute
### Keywords: Cholesky factor

### ** Examples

require(Matrix)
cholPermute(sparseMatrix(i = c(1,1,2,2),
                         j = c(1, 2, 1, 2),
                         x = c(0.1, 0.2, 0.2, 1)))



