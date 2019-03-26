library(bartMachine)


### Name: bart_machine_get_posterior
### Title: Get Full Posterior Distribution
### Aliases: bart_machine_get_posterior
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D #Regression example
##D 
##D #generate Friedman data
##D set.seed(11)
##D n  = 200 
##D p = 5
##D X = data.frame(matrix(runif(n * p), ncol = p))
##D y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)
##D 
##D ##build BART regression model
##D bart_machine = bartMachine(X, y)
##D 
##D #get posterior distribution
##D posterior = bart_machine_get_posterior(bart_machine, X)
##D print(posterior$y_hat)
##D 
##D 
##D #Classification example
##D 
##D #get data and only use 2 factors
##D data(iris)
##D iris2 = iris[51:150,]
##D iris2$Species = factor(iris2$Species)
##D 
##D #build BART classification model
##D bart_machine = bartMachine(iris2[ ,1 : 4], iris2$Species)
##D 
##D #get posterior distribution
##D posterior = bart_machine_get_posterior(bart_machine, iris2[ ,1 : 4])
##D print(posterior$y_hat)
## End(Not run)





