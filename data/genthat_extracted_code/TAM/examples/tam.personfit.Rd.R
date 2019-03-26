library(TAM)


### Name: tam.personfit
### Title: Person Outfit and Infit Statistics
### Aliases: tam.personfit

### ** Examples

#############################################################################
# EXAMPLE 1: Person fit dichotomous data
#############################################################################

data(data.sim.rasch, package="TAM")
resp <- data.sim.rasch

#*** estimate Rasch model
mod1 <- TAM::tam.mml(resp=resp)
summary(mod1)

#*** compute person fit statistics
fmod1 <- TAM::tam.personfit(mod1)
head(fmod1)



