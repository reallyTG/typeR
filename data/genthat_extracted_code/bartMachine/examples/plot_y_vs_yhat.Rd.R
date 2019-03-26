library(bartMachine)


### Name: plot_y_vs_yhat
### Title: Plot the fitted Versus Actual Response
### Aliases: plot_y_vs_yhat
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D #generate linear data
##D set.seed(11)
##D n  = 500 
##D p = 3
##D X = data.frame(matrix(runif(n * p), ncol = p))
##D y = 3*X[ ,1] + 2*X[ ,2] +X[ ,3] + rnorm(n)
##D 
##D ##build BART regression model
##D bart_machine = bartMachine(X, y)
##D 
##D ##generate plot
##D plot_y_vs_yhat(bart_machine)
##D 
##D #generate plot with prediction bands
##D plot_y_vs_yhat(bart_machine, prediction_intervals = TRUE)
## End(Not run)




