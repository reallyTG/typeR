library(sparseinv)


### Name: Takahashi_Davis
### Title: Takahashi equations
### Aliases: Takahashi_Davis
### Keywords: Cholesky factor, inverse sparse subset

### ** Examples

require(Matrix)
Q = sparseMatrix(i = c(1, 1, 2, 2),
                 j = c(1, 2, 1, 2),
                 x = c(0.1, 0.2, 0.2, 1))
X <- cholPermute(Q)
S_partial = Takahashi_Davis(Q, cholQp = X$Qpermchol, P = X$P)



