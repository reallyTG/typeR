library(ciTools)


### Name: add_ci.lmerMod
### Title: Confidence Intervals for Linear Mixed Model Predictions
### Aliases: add_ci.lmerMod

### ** Examples

## Not run: 
##D dat <- lme4::sleepstudy
##D # Fit a linear mixed model (random intercept model)
##D fit <- lme4::lmer(Reaction ~ Days + (1|Subject), data = lme4::sleepstudy)
##D # Get the fitted values for each observation in dat, and
##D # append CIs for those fitted values to dat
##D add_ci(dat, fit, alpha = 0.5)
##D # Try the parametric bootstrap method, and make prediction at the population level
##D add_ci(dat, fit, alpha = 0.5, type = "boot", includeRanef = FALSE, nSims = 100)
## End(Not run)



