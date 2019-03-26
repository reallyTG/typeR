library(sjstats)


### Name: icc
### Title: Intraclass-Correlation Coefficient
### Aliases: icc icc.merMod icc.glmmTMB icc.stanreg icc.brmsfit

### ** Examples

library(lme4)
fit0 <- lmer(Reaction ~ 1 + (1 | Subject), sleepstudy)
icc(fit0)

# note: ICC for random-slope-intercept model usually not
# meaningful, unless you use "adjusted = TRUE" - see 'Note'.
fit1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
icc(fit1)
icc(fit1, adjusted = TRUE)

sleepstudy$mygrp <- sample(1:45, size = 180, replace = TRUE)
fit2 <- lmer(Reaction ~ Days + (1 | mygrp) + (1 | Subject), sleepstudy)
icc(fit2)
icc(fit2, adjusted = TRUE)

icc1 <- icc(fit1)
icc2 <- icc(fit2)

print(icc1, comp = "var")
print(icc2, comp = "var")

## Not run: 
##D # compute ICC for Bayesian mixed model, with an ICC for each
##D # sample of the posterior. The print()-method then shows
##D # the median ICC as well as 89% HDI for the ICC.
##D # Change interval with print-method:
##D # print(icc(m, posterior = TRUE), prob = .5)
##D 
##D if (requireNamespace("brms", quietly = TRUE)) {
##D   library(dplyr)
##D   sleepstudy$mygrp <- sample(1:5, size = 180, replace = TRUE)
##D   sleepstudy <- sleepstudy %>%
##D     group_by(mygrp) %>%
##D     mutate(mysubgrp = sample(1:30, size = n(), replace = TRUE))
##D   m <- brms::brm(
##D     Reaction ~ Days + (1 | mygrp / mysubgrp) + (1 | Subject),
##D     data = sleepstudy
##D   )
##D 
##D   # by default, 89% interval
##D   icc(m)
##D 
##D   # show 50% interval
##D   icc(m, prob = .5)
##D 
##D   # adjusted ICC, 89% interval
##D   icc(m, adjusted = TRUE)
##D 
##D   # variances based on posterior predictive distribution
##D   icc(m, ppd = TRUE)
##D }
## End(Not run)




