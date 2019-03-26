library(isotone)


### Name: mSolver
### Title: Chebyshev norm
### Aliases: mSolver
### Keywords: models

### ** Examples


##Fitting isotone regression using active set
set.seed(12345)
y <- rnorm(9)              ##response values
w <- rep(1,9)              ##unit weights
btota <- cbind(1:8, 2:9)   ##Matrix defining isotonicity (total order)
fit.cheby <- activeSet(btota, mSolver, weights = w, y = y)




