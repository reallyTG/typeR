library(trafo)


### Name: gpower
### Title: Gpower transformation for linear models
### Aliases: gpower

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable using divergence minimization following 
# Kullback-Leibler
gpower(object = lm_cars, method = "div.kl", plotit = FALSE)



