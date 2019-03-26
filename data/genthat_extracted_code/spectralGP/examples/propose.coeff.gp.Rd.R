library(spectralGP)


### Name: propose.coeff.gp
### Title: Proposes new coeffients in a spectral GP object.
### Aliases: propose.coeff.gp
### Keywords: models smooth spatial

### ** Examples

library(spectralGP)
rho=1
gp1=gp(128,matern.specdens,c(rho,4))
gp2=gp(c(64,64),matern.specdens,c(rho,4))
propose.coeff(gp1)
propose.coeff(gp2)
plot(gp1)
plot(gp2)
prior1=logdensity(gp1)
prior2=logdensity(gp2)
add.blocks(gp1)
add.blocks(gp2)
propose.coeff(gp1,block=2,proposal.sd=0.1)
propose.coeff(gp2,block=3,proposal.sd=0.1)
priorstar1=logdensity(gp1)
priorstar2=logdensity(gp2)
plot(gp1)
plot(gp2)



