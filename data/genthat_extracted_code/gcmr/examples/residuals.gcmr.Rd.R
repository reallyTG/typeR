library(gcmr)


### Name: residuals.gcmr
### Title: Quantile Residuals for Gaussian Copula Marginal Regression
### Aliases: residuals.gcmr
### Keywords: models regression

### ** Examples

## spatial binomial data
## Not run: 
##D data(malaria)
##D D <- sp::spDists(cbind(malaria$x, malaria$y))/1000
##D m <- gcmr(cbind(cases, size-cases) ~ netuse+I(green/100)+phc, data=malaria, 
##D marginal=binomial.marg, cormat=matern.cormat(D))
##D res <- residuals(m)
##D ## normal probability plot
##D qqnorm(res)
##D qqline(res)
##D ## or better via plot.gcmr
##D plot(m, which = 3)
## End(Not run)



