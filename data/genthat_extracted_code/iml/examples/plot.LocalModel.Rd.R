library(iml)


### Name: plot.LocalModel
### Title: Plot Local Model
### Aliases: plot.LocalModel

### ** Examples

if (require("randomForest")) {
# First we fit a machine learning model on the Boston housing data
data("Boston", package  = "MASS")
X = Boston[-which(names(Boston) == "medv")]
rf = randomForest(medv ~ ., data = Boston, ntree = 50)
mod = Predictor$new(rf, data = X)

# Explain the first instance of the dataset with the LocalModel method:
x.interest = X[1,]
lemon = LocalModel$new(mod, x.interest = x.interest, k = 2)
plot(lemon)
}



