library(mixtox)


### Name: iaPred
### Title: Mixture Toxicity Prediction Based on Independent Action
### Aliases: iaPred
### Keywords: independent action equal effect concentration ratio uniform
###   design concentration ratio arbitrary concentration ratio uniform
###   design table

### ** Examples

# data(cytotox)

## example 1
# using IA to predict the mixtures designed by equal effect concentration ratio (eecr) at the 
# effect concentration of EC05 and EC50
# the eecr mixture design is based on four heavy metals and four ion liquids(eight factors).
model <- cytotox$sgl$model
param <- cytotox$sgl$param
iaPred(model, param, mixType = "eecr", effv = c(0.05, 0.5))

## example 2
# using IA to predict the mixtures designed by uniform design concentration ratio (udcr)
# the udcr mixture design is based on seven antibiotics (seven factors).
# five levels (EC05, EC10, EC20, EC30, and EC50 ) are allocated in the uniform table using the 
# pseudo-level technique (Liang et al., 2001)
model <- antibiotox$sgl$model
param <- antibiotox$sgl$param
effv <- c(0.05, 0.05, 0.10, 0.10, 0.20, 0.20, 0.30, 0.30, 0.50, 0.50)
iaPred(model, param, mixType = "udcr", effv)

## example 3
# using IA to predict the mixtures designed by arbitrary concentration ratio (acr)
# the udcr mixture design is based on four antibiotics (four factors).
# the every component in the mixture shares exactly the same ratio (0.25) 
model <- antibiotox$sgl$model[1 : 4]
param <- antibiotox$sgl$param[1 : 4, ]
effv <- c(0.25, 0.25, 0.25, 0.25)
iaPred(model, param, mixType = "acr", effv)



