library(CDM)


### Name: predict
### Title: Expected Values and Predicted Probabilities from Item Response
###   Response Models
### Aliases: IRT.predict predict.din predict.gdina predict.mcdina
###   predict.gdm predict.slca
### Keywords: Predicted values Residuals

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Fitted Rasch model in TAM package
##D #############################################################################
##D 
##D #--- Model 1: Rasch model
##D library(TAM)
##D mod1 <- TAM::tam.mml(resp=TAM::sim.rasch)
##D # apply IRT.predict function
##D prmod1 <- CDM::IRT.predict(mod1, mod1$resp )
##D str(prmod1)
## End(Not run)

#############################################################################
# EXAMPLE 2: Predict function for din
#############################################################################

# DINA Model
mod1 <- CDM::din( CDM::sim.dina, q.matr=CDM::sim.qmatrix, rule="DINA" )
summary(mod1)
# apply predict method
prmod1 <- CDM::IRT.predict( mod1, sim.dina )
str(prmod1)



