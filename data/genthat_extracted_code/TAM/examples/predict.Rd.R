library(TAM)


### Name: predict
### Title: Expected Values and Predicted Probabilities for Fitted 'TAM'
###   Models
### Aliases: predict.tam.mml predict.tam.mml.3pl predict.tamaan
### Keywords: Expected counts

### ** Examples

#############################################################################
# EXAMPLE 1: Dichotomous data sim.rasch - predict method
#############################################################################

data(data.sim.rasch)
# 1PL estimation
mod1 <- TAM::tam.mml(resp=data.sim.rasch)
# predict method
prmod1 <- IRT.predict(mod1, data.sim.rasch)
str(prmod1)



