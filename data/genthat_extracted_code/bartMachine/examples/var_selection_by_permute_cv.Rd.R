library(bartMachine)


### Name: var_selection_by_permute_cv
### Title: Perform Variable Selection Using Cross-validation Procedure
### Aliases: var_selection_by_permute_cv
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D #generate Friedman data
##D set.seed(11)
##D n  = 150 
##D p = 100 ##95 useless predictors 
##D X = data.frame(matrix(runif(n * p), ncol = p))
##D y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
##D 
##D ##build BART regression model (not actually used in variable selection)
##D bart_machine = bartMachine(X, y)
##D 
##D #variable selection via cross-validation
##D var_sel_cv = var_selection_by_permute_cv(bart_machine, k_folds = 3)
##D print(var_sel_cv$best_method)
##D print(var_sel_cv$important_vars_cv)
## End(Not run)




