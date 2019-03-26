library(spectralGP)


### Name: points.gp
### Title: Add points for a one-dimensional process based on a spectral GP
###   object
### Aliases: points.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(c(128),matern.specdens,c(1,4))
simulate(gp1)
plot(gp1)
simulate(gp1)
points(gp1,col=2)




