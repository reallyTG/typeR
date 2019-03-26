library(r2glmm)


### Name: calc_sgv
### Title: Compute the standardized generalized variance (SGV) of a blocked
###   diagonal matrix.
### Aliases: calc_sgv

### ** Examples

library(Matrix)
v1 = matrix(c(1,0.5,0.5,1), nrow = 2)
v2 = matrix(c(1,0.2,0.1,0.2,1,0.3,0.1,0.3,1), nrow = 3)
v3 = matrix(c(1,0.1,0.1,0.1,1,0.2,0.1,0.2,1), nrow = 3)
calc_sgv(nblocks = 3, blksizes = c(2,3,3), vmat = Matrix::bdiag(v1,v2,v3))



