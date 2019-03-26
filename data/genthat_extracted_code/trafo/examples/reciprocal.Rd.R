library(trafo)


### Name: reciprocal
### Title: Reciprocal transformation for linear models
### Aliases: reciprocal

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable 
reciprocal(object = lm_cars)



