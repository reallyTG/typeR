library(bartMachine)


### Name: cov_importance_test
### Title: Importance Test for Covariate(s) of Interest
### Aliases: cov_importance_test
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D ##regression example
##D 
##D ##generate Friedman data
##D set.seed(11)
##D n  = 200 
##D p = 5
##D X = data.frame(matrix(runif(n * p), ncol = p))
##D y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
##D 
##D ##build BART regression model
##D bart_machine = bartMachine(X, y)
##D 
##D ##now test if X[, 1] affects Y nonparametrically under the BART model assumptions
##D cov_importance_test(bart_machine, covariates = c(1))
##D ## note the plot and the printed p-value
##D 
## End(Not run)




