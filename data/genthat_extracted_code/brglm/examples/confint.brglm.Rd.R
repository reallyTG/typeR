library(brglm)


### Name: confint.brglm
### Title: Computes confidence intervals of parameters for bias-reduced
###   estimation
### Aliases: confint.brglm confint.profile.brglm
### Keywords: models htest

### ** Examples

## Begin Example 1
## Not run: 
##D library(MASS)
##D data(bacteria)
##D contrasts(bacteria$trt) <- structure(contr.sdif(3),
##D           dimnames = list(NULL, c("drug", "encourage")))
##D # fixed effects analyses
##D m.glm.logit <- brglm(y ~ trt * week, family = binomial,
##D                      data = bacteria, method = "glm.fit")
##D m.brglm.logit <- brglm(y ~ trt * week, family = binomial,
##D                        data = bacteria, method = "brglm.fit")
##D p.glm.logit <- profile(m.glm.logit)
##D p.brglm.logit <- profile(m.brglm.logit)
##D #
##D plot(p.glm.logit)
##D plot(p.brglm.logit)
##D # confidence intervals for the glm fit based on the profiles of the
##D # ordinary deviance
##D confint(p.glm.logit)
##D # confidence intervals for the brglm fit
##D confint(p.brglm.logit, ci.method = "union")
##D confint(p.brglm.logit, ci.method = "mean")
##D # A cloglog link
##D m.brglm.cloglog <- update(m.brglm.logit, family = binomial(cloglog))
##D p.brglm.cloglog <- profile(m.brglm.cloglog)
##D plot(p.brglm.cloglog)
##D confint(m.brglm.cloglog, ci.method = "union")
##D confint(m.brglm.cloglog, ci.method = "mean")
##D ## End example
## End(Not run)
## Not run: 
##D ## Begin Example 2
##D y <- c(1, 1, 0, 0)
##D totals <- c(2, 2, 2, 2)
##D x1 <- c(1, 0, 1, 0)
##D x2 <- c(1, 1, 0, 0)
##D m1 <- brglm(y/totals ~ x1 + x2, weights = totals,
##D             family = binomial(cloglog))
##D p.m1 <- profile(m1)
##D confint(p.m1, method="zoom")
## End(Not run)



