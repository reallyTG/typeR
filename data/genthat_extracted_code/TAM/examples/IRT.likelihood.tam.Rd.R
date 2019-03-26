library(TAM)


### Name: IRT.likelihood
### Title: Extracting Individual Likelihood and Individual Posterior
### Aliases: IRT.likelihood.tam IRT.likelihood.tam.mml
###   IRT.likelihood.tam.mml.3pl IRT.likelihood.tamaan
###   IRT.likelihood.tam.latreg IRT.likelihood.tam.np IRT.posterior.tam
###   IRT.posterior.tam.mml IRT.posterior.tam.mml.3pl IRT.posterior.tamaan
###   IRT.posterior.tam.latreg IRT.posterior.tam.np
### Keywords: Individual likelihood Individual posterior

### ** Examples

#############################################################################
# EXAMPLE 1: Dichotomous data data.sim.rasch - extracting likelihood/posterior
#############################################################################

data(data.sim.rasch)
# 1PL estimation
mod1 <- TAM::tam.mml(resp=data.sim.rasch)
lmod1 <- IRT.likelihood(mod1)
str(lmod1)
pmod1 <- IRT.posterior(mod1)
str(pmod1)



