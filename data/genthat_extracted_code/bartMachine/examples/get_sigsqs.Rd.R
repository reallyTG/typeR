library(bartMachine)


### Name: get_sigsqs
### Title: Get Posterior Error Variance Estimates
### Aliases: get_sigsqs
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D #generate Friedman data
##D set.seed(11)
##D n  = 300 
##D p = 5
##D X = data.frame(matrix(runif(n * p), ncol = p))
##D y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
##D 
##D ##build BART regression model
##D bart_machine = bartMachine(X, y)
##D 
##D #get posterior sigma^2's after burn-in and plot
##D sigsqs = get_sigsqs(bart_machine, plot_hist = TRUE)
## End(Not run)




