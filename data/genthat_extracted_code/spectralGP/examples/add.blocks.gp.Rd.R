library(spectralGP)


### Name: add.blocks.gp
### Title: Adds coefficient block structure to a spectral GP object
### Aliases: add.blocks.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
gp1=gp(128,matern.specdens,c(1,4))
gp2=gp(c(64,64),matern.specdens,c(1,4))
add.blocks(gp1,c(1,3,7,15,31,64))
add.blocks(gp2)
propose.coeff(gp1,block=5)
plot(gp1)
propose.coeff(gp2,block=2,proposal.sd=0.1)
plot(gp2)



