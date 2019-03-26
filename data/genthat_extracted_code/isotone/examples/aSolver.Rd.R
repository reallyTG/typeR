library(isotone)


### Name: aSolver
### Title: Asymmetric Least Squares
### Aliases: aSolver
### Keywords: models

### ** Examples


##Fitting isotone regression using active set
set.seed(12345)
y <- rnorm(9)              ##response values
w <- rep(1,9)              ##unit weights
btota <- cbind(1:8, 2:9)   ##Matrix defining isotonicity (total order)
fit.asy <- activeSet(btota, aSolver, weights = w, y = y, aw = 0.3, bw = 0.5)




