library(bartMachine)


### Name: linearity_test
### Title: Test of Linearity
### Aliases: linearity_test
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D ##regression example
##D 
##D ##generate Friedman data i.e. a nonlinear response model
##D set.seed(11)
##D n  = 200 
##D p = 5
##D X = data.frame(matrix(runif(n * p), ncol = p))
##D y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
##D 
##D ##now test if there is a nonlinear relationship between X1, ..., X5 and y.
##D linearity_test(X = X, y = y)
##D ## note the plot and the printed p-value.. should be approx 0
##D 
##D #generate a linear response model
##D y = 1 * X[ ,1] + 3 * X[,2] + 5 * X[,3] + 7 * X[ ,4] + 9 * X[,5] + rnorm(n)
##D linearity_test(X = X, y = y)
##D ## note the plot and the printed p-value.. should be > 0.05
##D 
## End(Not run)




