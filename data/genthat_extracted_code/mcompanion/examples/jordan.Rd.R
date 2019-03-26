library(mcompanion)


### Name: jordan
### Title: Utilities for Jordan matrices
### Aliases: Jordan_matrix from_Jordan chain_ind chains_to_list
### Keywords: matrices

### ** Examples

mat2 <- make_mcmatrix(eigval = c(1), co = cbind(c(1,1,1,1), c(0,1,0,0)), dim = 4, len.block = c(2))
mat2
mat2 %*% c(1,1,1,1) # e.v. for eigenvalue 1

mat2 %*% c(0,1,0,0)     # gen.e.v. for eigenvalue 1
c(1,1,1,1) + c(0,1,0,0) # same (confirming the above)

## mat2 X = X jordan.block
cbind(c(1,1,1,1), c(0,1,0,0)) %*% cbind(c(1,0), c(1,1))
mat2 %*% cbind(c(1,1,1,1), c(0,1,0,0))

mat2.X <- cbind(c(1,1,1,1), c(0,1,0,0), c(0,0,1,0), c(0,0,0,1))
mat2.X
mat2.J <- cbind(c(1,0,0,0), c(1,1,0,0), rep(0,4), rep(0,4))
mat2.J

mat2.X %*% mat2.J %*% solve(mat2.X)
mat2  # same

mat2.X %*% mat2.J
mat2 %*% mat2.X    # same



