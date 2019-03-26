library(iml)


### Name: plot.Shapley
### Title: Plot Shapley
### Aliases: plot.Shapley

### ** Examples

## Not run: 
##D if (require("rpart")) {
##D # First we fit a machine learning model on the Boston housing data
##D data("Boston", package  = "MASS")
##D rf =  rpart(medv ~ ., data = Boston)
##D X = Boston[-which(names(Boston) == "medv")]
##D mod = Predictor$new(rf, data = X)
##D 
##D # Then we explain the first instance of the dataset with the Shapley method:
##D x.interest = X[1,]
##D shapley = Shapley$new(mod, x.interest = x.interest)
##D plot(shapley)
##D }
## End(Not run)



