library(bartMachine)


### Name: bartMachine
### Title: Build a BART Model
### Aliases: bartMachine build_bart_machine
### Keywords: ~kwd1 ~kwd2

### ** Examples

##regression example

##generate Friedman data
set.seed(11)
n  = 200 
p = 5
X = data.frame(matrix(runif(n * p), ncol = p))
y = 10 * sin(pi* X[ ,1] * X[,2]) +20 * (X[,3] -.5)^2 + 10 * X[ ,4] + 5 * X[,5] + rnorm(n)

##build BART regression model
bart_machine = bartMachine(X, y)
summary(bart_machine)

## Not run: 
##D ##Build another BART regression model
##D bart_machine = bartMachine(X,y, num_trees = 200, num_burn_in = 500,
##D num_iterations_after_burn_in = 1000)
##D 
##D ##Classification example
##D 
##D #get data and only use 2 factors
##D data(iris)
##D iris2 = iris[51:150,]
##D iris2$Species = factor(iris2$Species)
##D 
##D #build BART classification model
##D bart_machine = build_bart_machine(iris2[ ,1:4], iris2$Species)
##D 
##D ##get estimated probabilities
##D phat = bart_machine$p_hat_train
##D ##look at in-sample confusion matrix
##D bart_machine$confusion_matrix
## End(Not run)







