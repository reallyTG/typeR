library(spectralGP)


### Name: updateprocess.gp
### Title: Recalculate process values in a spectral GP object
### Aliases: updateprocess.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(128,matern.specdens,c(1,4))
propose.coeff(gp1)
gp1$coeff[1,1]=0
updateprocess(gp1)



