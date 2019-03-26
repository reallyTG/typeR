library(trafo)


### Name: diagnostics.trafo_lm
### Title: Diagnostics for an untransformed and a transformed model
### Aliases: diagnostics.trafo_lm

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Compare transformed models
BD_lm <- trafo_lm(object = lm_cars, trafo = "bickeldoksum", 
method = "skew", lambdarange = c(1e-11, 2))

# Get diagnostics
diagnostics(BD_lm)



