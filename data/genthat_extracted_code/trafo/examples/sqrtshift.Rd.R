library(trafo)


### Name: sqrtshift
### Title: Square-root shift transformation for linear models
### Aliases: sqrtshift

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable using a maximum likelihood approach
sqrtshift(object = lm_cars, plotit = TRUE)



