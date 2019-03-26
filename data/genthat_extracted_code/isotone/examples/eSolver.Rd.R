library(isotone)


### Name: eSolver
### Title: L1 approximation
### Aliases: eSolver
### Keywords: models

### ** Examples


##Fitting isotone regression using active set
set.seed(12345)
y <- rnorm(9)              ##response values
w <- rep(1,9)              ##unit weights
eps = 0.01                 ##error term
btota <- cbind(1:8, 2:9)   ##Matrix defining isotonicity (total order)
fit.approx <- activeSet(btota, eSolver, weights = w, y = y, eps = eps)




