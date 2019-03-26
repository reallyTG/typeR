library(bartMachine)


### Name: bartMachineCV
### Title: Build BART-CV
### Aliases: bartMachineCV build_bart_machine_cv
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
##D ##build BART regression model
##D bart_machine_cv = bartMachineCV(X, y)
##D 
##D #information about cross-validated model
##D summary(bart_machine_cv)
## End(Not run)




