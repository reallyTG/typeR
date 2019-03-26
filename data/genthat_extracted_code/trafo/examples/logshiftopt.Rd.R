library(trafo)


### Name: logshiftopt
### Title: Log shift opt transformation for linear models
### Aliases: logshiftopt

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable using divergence minimization following
# Kolmogorov-Smirnof
logshiftopt(object = lm_cars, method = "div.ks", plotit = FALSE)



