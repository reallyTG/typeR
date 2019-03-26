library(ciTools)


### Name: add_pi
### Title: Add Prediction Intervals to Data Frames
### Aliases: add_pi

### ** Examples

# Fit a linear model
fit <- lm(dist ~ speed, data = cars)
# Define some new data
new_data <- cars[sample(NROW(cars), 10), ]
# Add fitted values and prediction intervals to new_data
add_pi(new_data, fit)

# Fit a Poisson model
fit2 <- glm(dist ~ speed, family = "poisson", data = cars)
# Add approximate prediction intervals to the fitted values of
# new_data
add_pi(new_data, fit2)

# Fit a linear mixed model
fit3 <- lme4::lmer(Reaction ~ Days + (1|Subject), data = lme4::sleepstudy)
# Add parametric prediction intervals for the fitted values to the
# original data
add_pi(lme4::sleepstudy, fit3, type = "parametric")





