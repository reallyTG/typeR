library(bartMachine)


### Name: calc_prediction_intervals
### Title: Calculate Prediction Intervals
### Aliases: calc_prediction_intervals
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
##D bart_machine = bartMachine(X, y)
##D 
##D #get prediction interval
##D pred_int = calc_prediction_intervals(bart_machine, X)
##D print(head(pred_int))
## End(Not run)




