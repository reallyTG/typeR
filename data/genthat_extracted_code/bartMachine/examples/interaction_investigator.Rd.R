library(bartMachine)


### Name: interaction_investigator
### Title: Explore Pairwise Interactions in BART Model
### Aliases: interaction_investigator
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
##D #investigate interactions
##D interaction_investigator(bart_machine)
## End(Not run)




