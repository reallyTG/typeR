library(mixtox)


### Name: gcaPred
### Title: Mixture Toxicity Prediction Using GCA (General)
### Aliases: gcaPred
### Keywords: generalized concentration addition equal effect concentration
###   ratio uniform design concentration ratio arbitrary concentration
###   ratio uniform design table

### ** Examples

## example 1
# using GCA to predict the mixtures designed by equal effect concentration ratio (eecr) at the 
# effect concentration of EC50
# the eecr mixture design is based on seven antibiotics(seven factors).
model <- antibiotox$sgl$model
param <- antibiotox$sgl$param
refEffv <- c(0.1, 0.50, 0.80)
gcaPred(model, param, mixType = "eecr", effv = 0.5, refEffv, rtype = 'quantal')

## example 2
# using GCA to predict the mixtures designed by uniform design concentration ratio (udcr)
# the udcr mixture design is based on 2 antibiotics(2 factors) and 
# three levels (EC05, EC20, and EC50 )
model <- antibiotox$sgl$model[1 : 2]
param <- antibiotox$sgl$param[1 : 2, ]
effv <- c(0.05, 0.20, 0.50)
refEffv <- c(0.1, 0.80)
gcaPred(model, param, mixType = "udcr", effv, refEffv, rtype = 'quantal')

## example 3
# using GCA to predict the mixtures designed by arbitrary concentration ratio (acr)
# the udcr mixture design is based on 2 heavy metals (2 factors).
# the every component in the mixture shares exactly the same ratio (0.5) 
model <- cytotox$sgl$model[1 : 2]
param <- cytotox$sgl$param[1 : 2, ]
effv <- c(0.5, 0.5)
refEffv <- c(0.1, 0.80)
gcaPred(model, param, mixType = "acr", effv, refEffv, rtype = 'quantal')



