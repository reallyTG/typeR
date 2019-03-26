library(isotone)


### Name: fSolver
### Title: User-Specified Loss Function
### Aliases: fSolver
### Keywords: models

### ** Examples


##Fitting isotone regression using active set (L2-norm user-specified)
set.seed(12345)
y <- rnorm(9)              ##response values
w <- rep(1,9)              ##unit weights
btota <- cbind(1:8, 2:9)   ##Matrix defining isotonicity (total order)
fit.convex <- activeSet(btota, fSolver, fobj = function(x) sum(w*(x-y)^2), 
gobj = function(x) 2*drop(w*(x-y)), y = y, weights = w)



