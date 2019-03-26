library(spectralGP)


### Name: logdensity.gp
### Title: Calculates log prior density of a spectral GP object
### Aliases: logdensity.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(128,matern.specdens,c(1,4))
gp2=gp(c(64,64),matern.specdens,c(1,4))
propose.coeff(gp1)
propose.coeff(gp2)
print(logdensity(gp1))
print(logdensity(gp2))



