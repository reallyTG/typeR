library(mcompanion)


### Name: mc_factorize
### Title: Factorise multi-companion matrices
### Aliases: mc_factorize mc_leftc
### Keywords: matrices

### ** Examples

mat2 <- make_mcmatrix(eigval = c(1), co = cbind(c(1,1,1,1), c(0,1,0,0)), dim = 4, len.block = c(2))
mat2
eigen(mat2)
mc_leftc(mat2, mo = 4, mo.col = 2)
mCompanion(mat2)
mCompanion(mat2, mo=4, mo.col=2)
mc_leftc(mCompanion(mat2), mo = 4, mo.col = 2)
mc_eigen(mCompanion(mat2), mo = 4, mo.col = 2)
mc_eigen(mCompanion(mat2, mo=4, mo.col=2), mo = 4, mo.col = 2)



