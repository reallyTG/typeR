library(iml)


### Name: Interaction
### Title: Feature interactions
### Aliases: Interaction

### ** Examples

if (require("rpart")) {
set.seed(42)
# Fit a CART on the Boston housing data set
data("Boston", package  = "MASS")
rf = rpart(medv ~ ., data = Boston)
# Create a model object
mod = Predictor$new(rf, data = Boston[-which(names(Boston) == "medv")]) 

# Measure the interaction strength
ia = Interaction$new(mod)

# Plot the resulting leaf nodes
plot(ia) 


# Extract the results 
dat = ia$results
head(dat)
## Not run: 
##D # Interaction also works with multiclass classification
##D rf = rpart(Species ~ ., data = iris)
##D mod = Predictor$new(rf, data = iris, type = "prob")
##D 
##D # For some models we have to specify additional arguments for the predict function
##D ia = Interaction$new(mod)
##D 
##D ia$plot()
##D 
##D # For multiclass classification models, you can choose to only show one class:
##D mod = Predictor$new(rf, data = iris, type = "prob", class = "virginica")
##D plot(Interaction$new(mod))
## End(Not run)
}



