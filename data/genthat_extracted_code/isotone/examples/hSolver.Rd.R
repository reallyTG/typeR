library(isotone)


### Name: hSolver
### Title: Huber Loss Function
### Aliases: hSolver
### Keywords: models

### ** Examples


##Fitting isotone regression using active set
set.seed(12345)
y <- rnorm(9)              ##response values
w <- rep(1,9)              ##unit weights
eps <- 0.01
btota <- cbind(1:8, 2:9)   ##Matrix defining isotonicity (total order)
fit.huber <- activeSet(btota, hSolver, weights = w, y = y, eps = eps)




