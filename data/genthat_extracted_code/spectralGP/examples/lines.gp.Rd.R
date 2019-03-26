library(spectralGP)


### Name: lines.gp
### Title: Add a line plot for a one-dimensional process based on a
###   spectral GP object
### Aliases: lines.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(c(128),matern.specdens,c(1,4))
simulate(gp1)
plot(gp1)
simulate(gp1)
lines(gp1,col=2)




