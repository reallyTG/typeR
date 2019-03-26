library(trafo)


### Name: bickeldoksum
### Title: Bickel-Doksum transformation for linear models
### Aliases: bickeldoksum

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable using a maximum likelihood approach
bickeldoksum(object = lm_cars, plotit = FALSE)



