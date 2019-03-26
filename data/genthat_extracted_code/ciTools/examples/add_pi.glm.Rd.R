library(ciTools)


### Name: add_pi.glm
### Title: Prediction Intervals for Generalized Linear Models
### Aliases: add_pi.glm

### ** Examples

# Fit a Poisson model
fit <- glm(dist ~ speed, data = cars, family = "poisson")
# Add prediction intervals and fitted values to the original data frame
add_pi(cars, fit)
# Try a different confidence level
add_pi(cars, fit, alpha = 0.5)
# Try custom names for the prediction bounds (may be useful for plotting)
add_pi(cars, fit, alpha = 0.5, names = c("lwr", "upr"))




