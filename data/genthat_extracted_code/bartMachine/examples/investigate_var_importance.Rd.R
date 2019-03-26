library(bartMachine)


### Name: investigate_var_importance
### Title: Explore Variable Inclusion Proportions in BART Model
### Aliases: investigate_var_importance
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D #generate Friedman data
##D set.seed(11)
##D n  = 200 
##D p = 10
##D X = data.frame(matrix(runif(n * p), ncol = p))
##D y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
##D 
##D ##build BART regression model
##D bart_machine = bartMachine(X, y, num_trees = 20)
##D 
##D #investigate variable inclusion proportions
##D investigate_var_importance(bart_machine)
## End(Not run)




