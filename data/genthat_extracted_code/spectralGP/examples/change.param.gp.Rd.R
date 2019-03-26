library(spectralGP)


### Name: change.param.gp
### Title: Changes correlation function parameter values of a spectral GP
###   object
### Aliases: change.param.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
rho=1
gp1=gp(128,matern.specdens,c(rho,4))
gp2=gp(c(64,64),matern.specdens,c(rho,4),0.5)
propose.coeff(gp1)
propose.coeff(gp2)
print(logdensity(gp1))
print(logdensity(gp2))
rho=2
sigma=2.5
change.param(gp1,c(rho,4)) # change parameter values of correlation function
change.param(gp2,c(rho,4),sigma)
print(logdensity(gp1))
print(logdensity(gp2))



