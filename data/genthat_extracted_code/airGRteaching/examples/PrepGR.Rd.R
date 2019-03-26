library(airGRteaching)


### Name: PrepGR
### Title: Creation of the inputs required to run the CalGR and SimGR
###   functions
### Aliases: PrepGR

### ** Examples

library(airGR)

## data.frame of observed data
data(L0123001)
BasinObs2 <- BasinObs[, c("DatesR", "P", "E", "Qmm", "T")]

## Preparation of observed data for modelling
PREP <- PrepGR(ObsDF = BasinObs2, HydroModel = "GR4J", CemaNeige = FALSE)
str(PREP)



