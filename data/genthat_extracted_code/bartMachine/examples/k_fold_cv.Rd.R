library(bartMachine)


### Name: k_fold_cv
### Title: Estimate Out-of-sample Error with K-fold Cross validation
### Aliases: k_fold_cv
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D #generate Friedman data
##D set.seed(11)
##D n  = 200 
##D p = 5
##D X = data.frame(matrix(runif(n * p), ncol = p))
##D y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
##D 
##D #evaluate default BART on 5 folds
##D k_fold_val = k_fold_cv(X, y)
##D print(k_fold_val$rmse)
## End(Not run)




