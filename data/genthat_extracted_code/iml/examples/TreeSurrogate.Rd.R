library(iml)


### Name: TreeSurrogate
### Title: Decision tree surrogate model
### Aliases: TreeSurrogate

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
plot(dt) 

# Use the tree to predict new data
predict(dt, Boston[1:10,])

# Extract the results
dat = dt$results
head(dat)


# It also works for classification
rf = randomForest(Species ~ ., data = iris, ntree = 50)
X = iris[-which(names(iris) == "Species")]
mod = Predictor$new(rf, data = X, type = "prob")

# Fit a decision tree as a surrogate for the whole random forest
dt = TreeSurrogate$new(mod, maxdepth=2)

# Plot the resulting leaf nodes
plot(dt) 

# If you want to visualise the tree directly:
plot(dt$tree)

# Use the tree to predict new data
set.seed(42)
iris.sample = X[sample(1:nrow(X), 10),]
predict(dt, iris.sample)
predict(dt, iris.sample, type = "class")

# Extract the dataset
dat = dt$results
head(dat)
}



