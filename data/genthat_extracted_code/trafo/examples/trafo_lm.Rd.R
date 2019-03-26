library(trafo)


### Name: trafo_lm
### Title: Fits transformed linear models
### Aliases: trafo_lm

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Compare untransformed and transformed model
trafo_lm(object = lm_cars, trafo = "bickeldoksum", method = "skew", 
lambdarange = c(1e-11, 2))



