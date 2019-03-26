library(trafo)


### Name: boxcox
### Title: Box-Cox transformation for linear models
### Aliases: boxcox

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable using skewness minimization
boxcox(object = lm_cars, method = "skew", plotit = FALSE)



