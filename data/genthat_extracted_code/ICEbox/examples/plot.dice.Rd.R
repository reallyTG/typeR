library(ICEbox)


### Name: plot.dice
### Title: Create a plot of a 'dice' object.
### Aliases: plot.dice

### ** Examples

## Not run: 
##D require(ICEbox)
##D require(randomForest)
##D require(MASS) #has Boston Housing data, Pima
##D 
##D data(Boston) #Boston Housing data
##D X = Boston
##D y = X$medv
##D X$medv = NULL
##D 
##D ## build a RF:
##D bhd_rf_mod = randomForest(X, y)
##D 
##D ## Create an 'ice' object for the predictor "age":
##D bhd.ice = ice(object = bhd_rf_mod, X = X, y = y, predictor = "age", frac_to_build = .1) 
##D 
##D # estimate derivatives, then plot.
##D bhd.dice = dice(bhd.ice)
##D plot(bhd.dice)
## End(Not run)



