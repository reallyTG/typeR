library(bartMachine)


### Name: var_selection_by_permute
### Title: Perform Variable Selection using Three Threshold-based
###   Procedures
### Aliases: var_selection_by_permute
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D #generate Friedman data
##D set.seed(11)
##D n  = 300 
##D p = 20 ##15 useless predictors 
##D X = data.frame(matrix(runif(n * p), ncol = p))
##D y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
##D 
##D ##build BART regression model (not actuall used in variable selection)
##D bart_machine = bartMachine(X, y)
##D 
##D #variable selection
##D var_sel = var_selection_by_permute(bart_machine)
##D print(var_sel$important_vars_local_names)
##D print(var_sel$important_vars_global_max_names)
## End(Not run)
  


