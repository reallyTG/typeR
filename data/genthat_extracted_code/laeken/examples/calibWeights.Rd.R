library(laeken)


### Name: calibWeights
### Title: Calibrate sample weights
### Aliases: calibWeights
### Keywords: survey

### ** Examples

data(eusilc)
# construct auxiliary 0/1 variables for genders
aux <- calibVars(eusilc$rb090)
# population totals
totals <- c(3990798, 4191431)
# compute g-weights
g <- calibWeights(aux, eusilc$rb050, totals)
# compute final weights
weights <- g * eusilc$rb050
summary(weights)



