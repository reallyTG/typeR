library(trafo)


### Name: yeojohnson
### Title: Yeo-Johnson transformation for linear models
### Aliases: yeojohnson

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable using a maximum likelihood approach
yeojohnson(object = lm_cars, plotit = FALSE)



