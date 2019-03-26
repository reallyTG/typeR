library(isotone)


### Name: lfSolver
### Title: General Least Squares Loss Function
### Aliases: lfSolver
### Keywords: models

### ** Examples


##Fitting isotone regression 
set.seed(12345)
y <- rnorm(9)              ##response values
w <- diag(rep(1,9))        ##unit weight matrix
btota <- cbind(1:8, 2:9)   ##Matrix defining isotonicity (total order)
#fit.lf <- activeSet(btota, lfSolver, weights = w, y = y)




