library(gcmr)


### Name: profile.gcmr
### Title: Profile Log-Likelihood for Gaussian Copula Marginal Regression
###   Models
### Aliases: profile.gcmr
### Keywords: regression nonlinear

### ** Examples

## spatial binomial data
## Not run: 
##D data(malaria)
##D D <- sp::spDists(cbind(malaria$x, malaria$y))/1000
##D m <- gcmr(cbind(cases, size-cases) ~ netuse+I(green/100)+phc, data=malaria,
##D marginal=binomial.marg, cormat=matern.cormat(D), options=gcmr.options(seed=987))
##D prof <- profile(m, which = 2)
##D prof
## End(Not run)



