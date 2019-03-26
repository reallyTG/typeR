library(mcompanion)


### Name: make_mcmatrix
### Title: Generate a multi-companion matrix from spectral description
### Aliases: make_mcmatrix make_mcchains
### Keywords: matrices

### ** Examples

make_mcchains(c(1), co = cbind(c(1,1,1,1), c(1,2,1,1)), dim = 4,
              len.block = c(2), eigval0 = TRUE)

make_mcmatrix(eigval = c(1), co = cbind(c(1,1,1,1), c(1,2,1,1)), dim = 4,
              len.block = c(2))
make_mcmatrix(eigval = c(1), co = cbind(c(1,1,1,1), c(1,2,3,4)), dim = 4,
              len.block = c(2))



