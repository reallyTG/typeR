library(iml)


### Name: FeatureImp
### Title: Feature importance
### Aliases: FeatureImp

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


# Since the result is a ggplot object, you can extend it: 
if (require("ggplot2")) {
  plot(imp) + theme_bw()
  # If you want to do your own thing, just extract the data: 
  imp.dat = imp$results
  head(imp.dat)
  ggplot(imp.dat, aes(x = feature, y = importance)) + geom_point() + 
  theme_bw()
}

# We can also look at the difference in model error instead of the ratio
imp = FeatureImp$new(mod, loss = "mae", compare = "difference")

# Plot the results directly
plot(imp)


# FeatureImp also works with multiclass classification. 
# In this case, the importance measurement regards all classes
tree = rpart(Species ~ ., data= iris)
X = iris[-which(names(iris) == "Species")]
y = iris$Species
mod = Predictor$new(tree, data = X, y = y, type = "prob") 

# For some models we have to specify additional arguments for the predict function
imp = FeatureImp$new(mod, loss = "ce")
plot(imp)

# For multiclass classification models, you can choose to only compute performance for one class. 
# Make sure to adapt y
mod = Predictor$new(tree, data = X, y = y == "virginica", 
 type = "prob", class = "virginica") 
imp = FeatureImp$new(mod, loss = "ce")
plot(imp)
}



