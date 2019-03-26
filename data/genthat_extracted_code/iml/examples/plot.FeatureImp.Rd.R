library(iml)


### Name: plot.FeatureImp
### Title: Plot Feature Importance
### Aliases: plot.FeatureImp

### ** Examples

 
if (require("rpart")) {
# We train a tree on the Boston dataset:
data("Boston", package  = "MASS")
tree = rpart(medv ~ ., data = Boston)
y = Boston$medv
X = Boston[-which(names(Boston) == "medv")]
mod = Predictor$new(tree, data = X, y = y)

# Compute feature importances as the performance drop in mean absolute error
imp = FeatureImp$new(mod, loss = "mae")

# Plot the results directly
plot(imp)
}



