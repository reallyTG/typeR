library(trafo)


### Name: dual
### Title: Dual transformation for linear models
### Aliases: dual

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable using divergence minimization following
# Cramer-von-Mises
dual(object = lm_cars, method = "div.cvm", plotit = TRUE)



