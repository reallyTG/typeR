library(mcompanion)


### Name: mc_eigen
### Title: The eigen decomposition of a multi-companion matrix
### Aliases: mc_eigen mc_eigenvalues
### Keywords: matrices

### ** Examples

x <- sim_mc(6,4,mo.col=2)
x
y <- mCompanion(x,detect="gen")
y
z <- as.matrix(y)
xx <- mCompanion(x=z,mo.col=2)
mc_eigen(xx)



