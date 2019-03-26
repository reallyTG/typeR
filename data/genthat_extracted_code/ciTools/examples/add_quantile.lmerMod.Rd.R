library(ciTools)


### Name: add_quantile.lmerMod
### Title: Quantiles for the Response of a Linear Mixed Model
### Aliases: add_quantile.lmerMod

### ** Examples

dat <- lme4::sleepstudy

# Fit a random intercept model
fit <- lme4::lmer(Reaction ~ Days + (1|Subject), data = lme4::sleepstudy)

# Using the parametric method: given the model fit, what value
# of reaction time do we expect half of new reaction times to fall
# under?
add_quantile(dat, fit, p = 0.5)

# Using the parametric method:
# as above, but we ignore the random effects.
add_quantile(dat, fit, p = 0.5, includeRanef = FALSE)




