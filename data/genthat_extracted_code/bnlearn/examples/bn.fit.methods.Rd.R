library(bnlearn)


### Name: bn.fit utilities
### Title: Utilities to manipulate fitted Bayesian networks
### Aliases: 'bn.fit utilities' sigma fitted.bn.fit coef.bn.fit
###   residuals.bn.fit sigma.bn.fit logLik.bn.fit AIC.bn.fit BIC.bn.fit
###   fitted.bn.fit.gnode coef.bn.fit.gnode residuals.bn.fit.gnode
###   sigma.bn.fit.gnode fitted.bn.fit.dnode coef.bn.fit.dnode
###   residuals.bn.fit.dnode coef.bn.fit.onode fitted.bn.fit.cgnode
###   coef.bn.fit.cgnode residuals.bn.fit.cgnode sigma.bn.fit.cgnode
### Keywords: network scores convenience functions

### ** Examples

data(gaussian.test)
res = hc(gaussian.test)
fitted = bn.fit(res, gaussian.test)
coefficients(fitted)
coefficients(fitted$C)
str(residuals(fitted))

data(learning.test)
res2 = hc(learning.test)
fitted2 = bn.fit(res2, learning.test)
coefficients(fitted2$E)



