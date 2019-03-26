library(spectralGP)


### Name: getgrid.gp
### Title: Calculates the gridpoints in a spectral GP object
### Aliases: getgrid.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(128,matern.specdens,c(1,4))
gp2=gp(c(64,64),matern.specdens,c(1,4))
grid1=getgrid(gp1)
grid2=getgrid(gp2)



