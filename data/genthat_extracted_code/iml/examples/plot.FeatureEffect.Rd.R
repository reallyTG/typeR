library(iml)


### Name: plot.FeatureEffect
### Title: Plot FeatureEffect
### Aliases: plot.FeatureEffect

### ** Examples

# We train a random forest on the Boston dataset:
if (require("randomForest")) {
data("Boston", package  = "MASS")
rf = randomForest(medv ~ ., data = Boston, ntree = 50)
mod = Predictor$new(rf, data = Boston)

# Compute the partial dependence for the first feature
eff = FeatureEffect$new(mod, feature = "crim")

# Plot the results directly
plot(eff)
}



