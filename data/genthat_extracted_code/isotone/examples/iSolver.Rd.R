library(isotone)


### Name: iSolver
### Title: SILF Loss
### Aliases: iSolver
### Keywords: models

### ** Examples


##Fitting isotone regression using active set
set.seed(12345)
y <- rnorm(9)              ##response values
w <- rep(1,9)              ##unit weights
eps <- 2
beta <- 0.4

btota <- cbind(1:8, 2:9)   ##Matrix defining isotonicity (total order)
fit.silf <- activeSet(btota, iSolver, weights = w, y = y, beta = beta, eps = eps)




