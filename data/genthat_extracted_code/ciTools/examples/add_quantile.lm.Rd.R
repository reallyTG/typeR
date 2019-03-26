library(ciTools)


### Name: add_quantile.lm
### Title: Quantiles for the Response of a Linear Model
### Aliases: add_quantile.lm

### ** Examples


# Fit a linear Model
fit <- lm(dist ~ speed, data = cars)

# Find the 0.7-quantile (70th percentile) of new distances, given
# the linear model fit.
add_quantile(cars, fit, p = 0.7)

# As above, but with a custom name for the vector of quantiles
add_quantile(cars, fit, p = 0.7, name = "my_quantile")




