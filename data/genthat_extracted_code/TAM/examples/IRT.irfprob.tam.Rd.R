library(TAM)


### Name: IRT.irfprob
### Title: Extracting Item Response Functions
### Aliases: IRT.irfprob.tam IRT.irfprob.tam.mml IRT.irfprob.tam.mml.3pl
###   IRT.irfprob.tamaan IRT.irfprob.tam.np
### Keywords: Item response functions

### ** Examples

#############################################################################
# EXAMPLE 1: Dichotomous data data.sim.rasch - item response functions
#############################################################################

data(data.sim.rasch)
# 1PL estimation
mod1 <- TAM::tam.mml(resp=data.sim.rasch)
IRT.irfprob(mod1)



