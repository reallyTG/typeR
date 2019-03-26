library(ciTools)


### Name: add_pi.lm
### Title: Prediction Intervals for Linear Model Predictions
### Aliases: add_pi.lm

### ** Examples

# Fit a linear model
fit <- lm(dist ~ speed, data = cars)
# Add prediction intervals and fitted values to the original data
add_pi(cars, fit)

# Try to add predictions to a data frame of new data
new_data <- cars[sample(NROW(cars), 10), ]
add_pi(new_data, fit)

# Try a different confidence level
add_pi(cars, fit, alpha = 0.5)

# Add custom names to the prediction bounds.
add_pi(cars, fit, alpha = 0.5, names = c("lwr", "upr"))



