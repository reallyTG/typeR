library(spectralGP)


### Name: matern.specdens
### Title: Matern correlation spectral density function
### Aliases: matern.specdens
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(128,matern.specdens,c(1,4))
gp2=gp(c(64,64),matern.specdens,c(1,4))
dens1=matern.specdens(gp1$omega,c(1,4),d=1)
dens2=matern.specdens(gp2$omega,c(1,4),d=2)



