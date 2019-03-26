library(spTimer)


### Name: spT.priors
### Title: Priors for the spatio-temporal models.
### Aliases: spT.priors
### Keywords: spT

### ** Examples

## 

priors<-spT.priors(model="GPP",inv.var.prior=Gamm(2,1),
      beta.prior=Norm(0,10^4))
priors

##



