library(spectralGP)


### Name: copy.gp
### Title: Copy a spectral GP object.
### Aliases: copy.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(128,matern.specdens,c(1,4))
gp2=gp(128,matern.specdens,c(0.5,4))
copy(gp1,gp2)  # gp2 is now a copy of gp1, with first parameter equal to 1
gp3=copy(gp1)



