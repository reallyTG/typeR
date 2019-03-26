library(iml)


### Name: LocalModel
### Title: LocalModel
### Aliases: LocalModel

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
lemon

# Look at the results in a table
lemon$results
# Or as a plot
plot(lemon)

# Reuse the object with a new instance to explain
lemon$x.interest
lemon$explain(X[2,])
lemon$x.interest
plot(lemon)
  
# LocalModel also works with multiclass classification
rf = randomForest(Species ~ ., data= iris, ntree=50)
X = iris[-which(names(iris) == 'Species')]
mod = Predictor$new(rf, data = X, type = "prob", class = "setosa")

# Then we explain the first instance of the dataset with the LocalModel method:
lemon = LocalModel$new(mod, x.interest = X[1,], k = 2)
lemon$results
plot(lemon) 
}



