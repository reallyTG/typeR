library(sjstats)


### Name: hdi
### Title: Compute statistics for MCMC samples and Stan models
### Aliases: hdi hdi.stanreg hdi.brmsfit equi_test equi_test.stanreg
###   equi_test.brmsfit mcse mcse.brmsfit mcse.stanreg mediation
###   mediation.brmsfit n_eff n_eff.stanreg n_eff.brmsfit rope rope.stanreg
###   rope.brmsfit

### ** Examples

## Not run: 
##D if (require("rstanarm")) {
##D   fit <- stan_glm(mpg ~ wt + am, data = mtcars, chains = 1)
##D   hdi(fit)
##D 
##D   # return multiple intervals
##D   hdi(fit, prob = c(.5, .7, .9))
##D 
##D   # fit logistic regression model
##D   fit <- stan_glm(
##D     vs ~ wt + am,
##D     data = mtcars,
##D     family = binomial("logit"),
##D     chains = 1
##D   )
##D   # compute hdi, transform on "odds ratio scale"
##D   hdi(fit, trans = exp)
##D 
##D   # compute rope, on scale of linear predictor. finds proportion
##D   # of posterior distribution values between -1 and 1.
##D   rope(fit, rope = c(-1, 1))
##D 
##D   # compute rope, boundaries as "odds ratios". finds proportion of
##D   # posterior distribution values, which - after being exponentiated -
##D   # are between .8 and 1.25 (about -.22 and .22 on linear scale)
##D   rope(fit, rope = c(.8, 1.25), trans = exp)
##D 
##D   # Test for Practical Equivalence
##D   equi_test(fit)
##D   equi_test(fit, out = "plot")
##D }
## End(Not run)




