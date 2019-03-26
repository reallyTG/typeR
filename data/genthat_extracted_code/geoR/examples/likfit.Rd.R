library(geoR)


### Name: likfit
### Title: Likelihood Based Parameter Estimation for Gaussian Random Fields
### Aliases: likfit logLik.likGRF resid.likGRF residuals.likGRF
###   fitted.likGRF likfit likfit.limits .negloglik.GRF logLik.likGRF
###   check.parameters.values
### Keywords: spatial models

### ** Examples

## Not run: 
##D ml <- likfit(s100, ini=c(0.5, 0.5), fix.nug = TRUE)
##D ml
##D summary(ml)
##D reml <- likfit(s100, ini=c(0.5, 0.5), fix.nug = TRUE, lik.met = "REML")
##D summary(reml)
##D plot(variog(s100))
##D lines(ml)
##D lines(reml, lty = 2)
## End(Not run)



