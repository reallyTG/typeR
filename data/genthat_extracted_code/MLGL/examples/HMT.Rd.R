library(MLGL)


### Name: HMT
### Title: Hierarchical Multiple Testing procedure Apply Hierarchical
###   Multiple Testing procedure on a 'MLGL' object
### Aliases: HMT

### ** Examples

set.seed(42)
X <- simuBlockGaussian(50, 12, 5, 0.7)
y <- drop(X[,c(2,7,12)] %*% c(2,2,-2) + rnorm(50, 0, 0.5))
res <- MLGL(X, y)

# perform hierarchical testing with FWER control
out <- HMT(res, X, y, alpha = 0.05)

# test a new value of alpha for a specific lambda
selFWER(out$hierTest[[60]], alpha = 0.1)





