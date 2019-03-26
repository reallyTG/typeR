library(isotone)


### Name: pSolver
### Title: Quantile Regression
### Aliases: pSolver
### Keywords: models

### ** Examples


##Fitting quantile regression
set.seed(12345)
y <- rnorm(9)              ##response values
w <- rep(1,9)              ##unit weights
btota <- cbind(1:8, 2:9)   ##Matrix defining isotonicity (total order)
fit.p <- activeSet(btota, pSolver, weights = w, y = y, aw = 0.3, bw = 0.7)




