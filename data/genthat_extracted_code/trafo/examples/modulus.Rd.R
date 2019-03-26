library(trafo)


### Name: modulus
### Title: Modulus transformation for linear models
### Aliases: modulus

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable with fixed lambda 
modulus(object = lm_cars, lambda = 0.8, plotit = FALSE)



