library(JoSAE)


### Name: eblup.mse.f.wrap
### Title: Functions to calculate the variance of an EBLUP estimate.
### Aliases: eblup.mse.f.wrap eblup.mse.f.gamma.i eblup.mse.f.c1
###   eblup.mse.f.c2.ai eblup.mse.f.c2 eblup.mse.f.c3.asyvarcovarmat
###   eblup.mse.f.c3 eblup.mse.f.c3.star

### ** Examples

library(nlme)
data(JoSAE.sample.data)
#fit a lme 
summary(fit.lme <- lme(biomass.ha ~ mean.canopy.ht, data=JoSAE.sample.data
                       , random=~1|domain.ID))
#calculate the first component of the EBLUP variance for a domain with 5 samples
eblup.mse.f.c1(fit.lme, 5, 0.2)



