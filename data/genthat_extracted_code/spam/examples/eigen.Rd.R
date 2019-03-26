library(spam)


### Name: eigen
### Title: Eigenvalues for Sparse Matrices
### Aliases: eigen.spam eigen_approx
### Keywords: algebra

### ** Examples

gmrf <- precmat.GMRFreglat(50, 50, c(.4,.3,.2,.1),'m2p4')
eigen.spam(gmrf, nev = 50, control = list(mode = "LM"))



