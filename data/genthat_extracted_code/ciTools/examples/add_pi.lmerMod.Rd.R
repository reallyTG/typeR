library(ciTools)


### Name: add_pi.lmerMod
### Title: Prediction Intervals for Linear Mixed Model Fitted Values
### Aliases: add_pi.lmerMod

### ** Examples

dat <- lme4::sleepstudy
# Fit a (random intercept) linear mixed model
fit <- lme4::lmer(Reaction ~ Days + (1|Subject), data = lme4::sleepstudy)
# Add 50% prediction intervals to the original data using the default
# method.
add_pi(dat, fit, alpha = 0.5)

# Add 50% prediction intervals to the original data using the
# parametric bootstrap method. Form prediction intervals at the population
# level (unconditional on the random effects).
add_pi(dat, fit, alpha = 0.5, type = "boot", includeRanef = FALSE)




