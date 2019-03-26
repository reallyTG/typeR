library(spectralGP)


### Name: plot.gp
### Title: Plot a process based on a spectral GP object
### Aliases: plot.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(c(128),matern.specdens,c(1,4))
simulate(gp1)
plot(gp1)
gp2=gp(c(256,256),matern.specdens,c(1,0.5))
simulate(gp2)
plot(gp2)




