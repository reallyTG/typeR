library(iml)


### Name: Shapley
### Title: Prediction explanations with game theory
### Aliases: Shapley

### ** Examples

if (require("rpart")) {
# First we fit a machine learning model on the Boston housing data
data("Boston", package  = "MASS")
rf =  rpart(medv ~ ., data = Boston)
X = Boston[-which(names(Boston) == "medv")]
mod = Predictor$new(rf, data = X)

# Then we explain the first instance of the dataset with the Shapley method:
x.interest = X[1,]
shapley = Shapley$new(mod, x.interest = x.interest)
shapley

# Look at the results in a table
shapley$results
# Or as a plot
plot(shapley)

# Explain another instance
shapley$explain(X[2,])
plot(shapley)
## Not run: 
##D # Shapley() also works with multiclass classification
##D rf = rpart(Species ~ ., data = iris)
##D X = iris[-which(names(iris) == "Species")]
##D mod = Predictor$new(rf, data = X, type = "prob")
##D 
##D # Then we explain the first instance of the dataset with the Shapley() method:
##D shapley = Shapley$new(mod, x.interest = X[1,])
##D shapley$results
##D plot(shapley) 
##D 
##D # You can also focus on one class
##D mod = Predictor$new(rf, data = X, type = "prob", class = "setosa")
##D shapley = Shapley$new(mod, x.interest = X[1,])
##D shapley$results
##D plot(shapley) 
## End(Not run)
}



