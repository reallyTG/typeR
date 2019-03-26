library(mcompanion)


### Name: mcStable
### Title: Check if an object is stable
### Aliases: mcStable mcStable-methods
### Keywords: matrices

### ** Examples

## a simulated matrix (it is stable by default)
mc <- mCompanion("sim", dim=4, mo=2)
mcStable(mc)

## a square matrix
m <- matrix(1:9, nrow=3)
eigen(m)$values
mcStable(m)

## a 2x4 matrix, taken to be the top of an mc matrix
m <- matrix(1:8, nrow=2)
mcStable(m)
mCompanion(m)

## a vector, taken to be the top row of an mc matrix
v <- 1:4
mcStable(v)
mCompanion(v)
abs(mc_eigen(mCompanion(v))$values)

co1 <- cbind(c(1,1,1,1), c(0,1,0,0))

## a matrix with eigenvalues equal to 1
mat2 <- make_mcmatrix(eigval = c(1), co = co1, dim = 4, len.block = c(2))
## mat2 is ordinary matrix, eigenvalues are computed numerically
eigen(mat2)
mcStable(mat2)  # FALSE but in general depends on floating point arithmetic

mat2a <- mCompanion(x="gen", eigval = c(1), co = co1, dim = 4, len.block = c(2), what.res = "list")
mc_eigen(mat2a)
mcStable(mat2a)


mat2b0 <- make_mcmatrix(eigval = c(1), co = co1, dim = 4, len.block = c(2), what = "list")
mat2b <- mCompanion(mat2b0, "gen")
mc_eigen(mat2b)
mcStable(mat2b)

## mat2c is a MultiCompanion object with the eigenvalues stored in it
mat2c <- mCompanion(x="sim", eigval = c(1,0,0), co = cbind(co1, c(0,0,1,0), c(0,0,0,1)),
                    dim = 4, len.block = c(2,1,1))
mat2c
## since the eigenvalues are directly available here, no need to compute them
mc_eigen(mat2c) # contains a 2x2 Jordan block.
mcStable(mat2c)



