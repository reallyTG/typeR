library(ciTools)


### Name: add_ci.glm
### Title: Confidence Intervals for Generalized Linear Model Predictions
### Aliases: add_ci.glm

### ** Examples

# Poisson regression
fit <- glm(dist ~ speed, data = cars, family = "poisson")
add_ci(cars, fit)
# Try a different confidence level
add_ci(cars, fit, alpha = 0.5)
# Add custom names to the confidence bounds (may be useful for plotting)
add_ci(cars, fit, alpha = 0.5, names = c("lwr", "upr"))

# Logistic regression
fit2 <- glm(I(dist > 30) ~ speed, data = cars, family = "binomial")
dat <- cbind(cars, I(cars$dist > 30))
# Form 95% confidence intervals for the fit:
add_ci(dat, fit2)
# Form 50% confidence intervals for the fit:
add_ci(dat, fit2, alpha = 0.5)
# Make confidence intervals on the scale of the linear predictor
add_ci(dat, fit2, alpha = 0.5, response = FALSE)
# Add custom names to the confidence bounds
add_ci(dat, fit2, alpha = 0.5, names = c("lwr", "upr"))





