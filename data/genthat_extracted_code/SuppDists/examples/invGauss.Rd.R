library(SuppDists)


### Name: invGauss
### Title: The inverse Gaussian and Wald distributions
### Aliases: 'inverse Gaussian' 'Wald distribution' dinvGauss pinvGauss
###   qinvGauss rinvGauss sinvGauss
### Keywords: distribution

### ** Examples


pinvGauss(1, 1, 16)
pinvGauss(c(.65,1,1.45), 1, 16) ## approximately 5% 50% and 95%
pars<-sinvGauss(1, 16)
plot(function(x)dinvGauss(x,1, 16),pars$Mean-3*pars$SD,pars$Mean+3*pars$SD)



