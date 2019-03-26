library(ciTools)


### Name: add_quantile
### Title: Add Regression Quantiles to Data Frames
### Aliases: add_quantile

### ** Examples


# Fit a linear model
fit <- lm(dist ~ speed, data = cars)

# Find the 0.4 quantile (or 40th percentile) of new distances for
# each observations in cars, conditioned on the linear model.
add_quantile(cars, fit, p = 0.4)

# Fit a Poisson model
fit2 <- glm(dist ~ speed, family = "poisson", data = cars)
# Find the 0.4 quantile (or 40th percentile) of new distances for
# each observation in cars, conditioned on the Poisson model.
add_quantile(cars, fit2, p = 0.4)

# Fit a random intercept linear mixed model
fit3 <- lme4::lmer(Reaction ~ Days + (1|Subject), data = lme4::sleepstudy)
# Find the 0.4 quantile (or 40 percentile) of reaction times for
# each observation in the sleepstudy data. Condition on the model and random effects.
add_quantile(lme4::sleepstudy, fit3, p = 0.4, type = "parametric")





