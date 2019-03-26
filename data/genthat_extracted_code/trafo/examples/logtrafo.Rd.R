library(trafo)


### Name: logtrafo
### Title: Log transformation for linear models
### Aliases: logtrafo

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable 
logtrafo(object = lm_cars)



