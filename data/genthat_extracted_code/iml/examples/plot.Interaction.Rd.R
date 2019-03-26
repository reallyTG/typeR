library(iml)


### Name: plot.Interaction
### Title: Plot Interaction
### Aliases: plot.Interaction

### ** Examples

# We train a tree on the Boston dataset:
if (require("rpart")) {
data("Boston", package  = "MASS")
rf = rpart(medv ~ ., data = Boston)
mod = Predictor$new(rf, data = Boston)

# Compute the interactions
ia = Interaction$new(mod)

# Plot the results directly
plot(ia)
}



