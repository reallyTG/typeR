library(sparseinv)


### Name: densify
### Title: Densify with explicit zeroes
### Aliases: densify

### ** Examples

require(Matrix)
Q1 <- sparseMatrix(i = c(1, 2, 2), j = c(1, 1, 2), x = c(0.1, 0.2, 1))
Q2 <- sparseMatrix(i = c(1, 1, 2, 2),j = c(1, 2, 1, 2), x = c(0.1, 0.3, 0.2, 1))
Q1dens <- densify(Q1, Q2)
Q1
Q1dens



