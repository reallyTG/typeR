library(trafo)


### Name: manly
### Title: Manly transformation for linear models
### Aliases: manly

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable using a maximum likelihood approach
manly(object = lm_cars, plotit = FALSE)



