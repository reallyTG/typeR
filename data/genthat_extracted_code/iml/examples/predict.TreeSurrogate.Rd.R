library(iml)


### Name: predict.TreeSurrogate
### Title: Predict Tree Surrogate
### Aliases: predict.TreeSurrogate

### ** Examples

if (require("randomForest")) {
# Fit a Random Forest on the Boston housing data set
data("Boston", package  = "MASS")
rf = randomForest(medv ~ ., data = Boston, ntree = 50)
# Create a model object
mod = Predictor$new(rf, data = Boston[-which(names(Boston) == "medv")]) 

# Fit a decision tree as a surrogate for the whole random forest
dt = TreeSurrogate$new(mod)

# Plot the resulting leaf nodes
predict(dt, newdata = Boston)
} 



