library(spectralGP)


### Name: expand.gpgrid.gp
### Title: Calculate grid locations for a spectral GP object.
### Aliases: expand.gpgrid.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(128,matern.specdens,c(1,4))
gp2=gp(c(64,64),matern.specdens,c(1,4))
grid1=expand.gpgrid(gp1)
grid2=expand.gpgrid(gp2)
plot(grid2)



