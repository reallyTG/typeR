library(bartMachine)


### Name: get_var_counts_over_chain
### Title: Get the Variable Inclusion Counts
### Aliases: get_var_counts_over_chain
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D 
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
##D #get variable inclusion counts
##D var_counts = get_var_counts_over_chain(bart_machine)
##D print(var_counts)
## End(Not run)



