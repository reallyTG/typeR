library(ciTools)


### Name: add_ci.lm
### Title: Confidence Intervals for Linear Model Predictions
### Aliases: add_ci.lm

### ** Examples

# Fit a linear model
fit <- lm(dist ~ speed, data = cars)
# Get fitted values for each observation in cars, and append
# confidence intervals
add_ci(cars, fit)
# Try a different confidence level
add_ci(cars, fit, alpha = 0.5)
# Try custom names for the confidence bounds 
add_ci(cars, fit, alpha = 0.5, names = c("lwr", "upr"))




