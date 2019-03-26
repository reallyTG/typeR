library(mixtox)


### Name: caPred
### Title: Mixture Toxicity Prediction Based on Concentration Addition
### Aliases: caPred
### Keywords: concentration addition equal effect concentration ratio
###   uniform design concentration ratio arbitrary concentration ratio
###   uniform design table mixture effect

### ** Examples

## example 1
# using CA to predict the toxicity of mixture designed by eecr at the
# effect concentration of EC05 and EC50
# eecr mixture design is based on seven antibiotics(factors).
model <- antibiotox$sgl$model
param <- antibiotox$sgl$param
caPred(model, param, mixType = "eecr", effv = c(0.05, 0.5))

## example 2
# using CA to predict the mixtures designed by udcr
# the udcr mixture design is based on four heavy metals and four ionic liquids (eight factors).
# five levels (EC05, EC10, EC20, EC30, and EC50 ) are allocated in the uniform table using the
# pseudo-level technique (Liang et al., 2001)
model <- cytotox$sgl$model
param <- cytotox$sgl$param
effv <- c(0.05, 0.05, 0.10, 0.10, 0.20, 0.20, 0.30, 0.30, 0.50, 0.50)
caPred(model, param, mixType = "udcr", effv)

## example 3
# using CA to predict the mixtures designed by acr
# the udcr mixture design is based on five antibiotics (five factors).
# the every component in the mixture shares exactly the same ratio (0.20) 
model <- antibiotox$sgl$model[1 : 5]
param <- antibiotox$sgl$param[1 : 5, ]
effv <- c(0.2, 0.2, 0.2, 0.2, 0.2)
caPred(model, param, mixType = "acr", effv)



