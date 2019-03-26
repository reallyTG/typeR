library(fracdiff)


### Name: fracdiff-methods
### Title: Many Methods for "fracdiff" Objects
### Aliases: coef.fracdiff logLik.fracdiff print.fracdiff fitted.fracdiff
###   residuals.fracdiff vcov.fracdiff summary.fracdiff
###   print.summary.fracdiff
### Keywords: print models

### ** Examples

set.seed(7)
ts4 <- fracdiff.sim(10000, ar = c(0.6, -.05, -0.2), ma = -0.4, d = 0.2)
modFD <- fracdiff( ts4$series, nar = length(ts4$ar), nma = length(ts4$ma))
## -> warning (singular Hessian) %% FIXME ???
coef(modFD) # the estimated parameters
vcov(modFD)
smFD <- summary(modFD)
smFD
coef(smFD) # gives the whole table
AIC(modFD) # AIC works because of the logLik() method



