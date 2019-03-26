library(isotone)


### Name: oSolver
### Title: Lp norm
### Aliases: oSolver
### Keywords: models

### ** Examples


##Fitting isotone regression 
set.seed(12345)
y <- rnorm(9)               ##normal distributed response values
w1 <- rep(1,9)              ##unit weights
Atot <- cbind(1:8, 2:9)     ##Matrix defining isotonicity (total order)
fit.pow <- activeSet(Atot, oSolver, y = y, weights = w1, p = 1.2)




