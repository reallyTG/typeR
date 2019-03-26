library(trafo)


### Name: assumptions
### Title: First check of assumptions to find suitable transformations
### Aliases: assumptions

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

assumptions(lm_cars)
assumptions(lm_cars, method = "skew", manly_lr = c(0.000005,0.00005))



