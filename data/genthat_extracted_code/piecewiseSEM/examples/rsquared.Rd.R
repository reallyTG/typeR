library(piecewiseSEM)


### Name: rsquared
### Title: R-squared for linear regression
### Aliases: rsquared

### ** Examples


  ## Not run: 
##D     # Create data
##D     dat <- data.frame(
##D       ynorm = rnorm(100),
##D       ypois = rpois(100, 100),
##D       x1 = rnorm(100),
##D       random = letters[1:5]
##D     )
##D 
##D     # Get R2 for linear model
##D     rsquared(lm(ynorm ~ x1, dat))
##D 
##D     # Get R2 for generalized linear model
##D     rsquared(glm(ypois ~ x1, "poisson", dat))
##D 
##D     rsquared(glm(ypois ~ x1, "poisson", dat), method = "mcfadden") # McFadden R2
##D 
##D     # Get R2 for generalized least-squares model
##D     rsquared(gls(ynorm ~ x1, dat))
##D 
##D     # Get R2 for linear mixed effects model (nlme)
##D     rsquared(nlme::lme(ynorm ~ x1, random = ~ 1 | random, dat))
##D 
##D     # Get R2 for linear mixed effects model (lme4)
##D     rsquared(lme4::lmer(ynorm ~ x1 + (1 | random), dat))
##D 
##D     # Get R2 for generalized linear mixed effects model (lme4)
##D     rsquared(lme4::glmer(ypois ~ x1 + (1 | random), family = poisson, dat))
##D 
##D     rsquared(lme4::glmer(ypois ~ x1 + (1 | random), family = poisson, dat), method = "delta")
##D 
##D     # Get R2 for generalized linear mixed effects model (glmmPQL)
##D     rsquared(MASS::glmmPQL(ypois ~ x1, random = ~ 1 | random, family = poisson, dat))
##D   
## End(Not run)




