library(isotone)


### Name: dSolver
### Title: Absolute Value Norm
### Aliases: dSolver
### Keywords: models

### ** Examples


##Fitting weighted absolute norm problem
set.seed(12345)
y <- rnorm(9)              ##response values
w <- rep(1,9)              ##unit weights
btota <- cbind(1:8, 2:9)   ##Matrix defining isotonicity (total order)
fit.abs <- activeSet(btota, dSolver, weights = w, y = y)




