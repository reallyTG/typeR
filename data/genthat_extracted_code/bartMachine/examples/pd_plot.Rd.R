library(bartMachine)


### Name: pd_plot
### Title: Partial Dependence Plot
### Aliases: pd_plot
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
##D #partial dependence plot for quadratic term
##D pd_plot(bart_machine, "X3")
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
##D bart_machine = bartMachine(iris2[ ,1:4], iris2$Species)
##D 
##D #partial dependence plot 
##D pd_plot(bart_machine, "Petal.Width")
## End(Not run)





