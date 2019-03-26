library(trafo)


### Name: neglog
### Title: Neg log transformation for linear models
### Aliases: neglog

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable 
neglog(object = lm_cars)



