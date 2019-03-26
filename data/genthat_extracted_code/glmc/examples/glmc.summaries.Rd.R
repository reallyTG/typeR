library(glmc)


### Name: glmc.summaries
### Title: Accessing objects in glmc Fits
### Aliases: coef.glmc deviance.glmc effects.glmc family.glmc fitted.glmc
###   residuals.glmc weights.default
### Keywords: regression models

### ** Examples

## Don't show: 
example("glmc", echo = FALSE)
## End(Don't show)
## Not run: 
##D ##-- Continuing the  glmc(.) example:
##D coef(gfit)# the bare coefficients
##D 
##D ## The 2 basic regression diagnostic plots [plot.glmc(.) is preferred]
##D plot(resid(gfit), fitted(gfit))# Tukey-Anscombe's
##D abline(h=0, lty=2, col = 'gray')
##D 
##D qqnorm(residuals(gfit))
## End(Not run)



