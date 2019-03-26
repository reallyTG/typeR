library(qpcR)


### Name: akaike.weights
### Title: Calculation of Akaike weights/relative likelihoods/delta-AICs
### Aliases: akaike.weights
### Keywords: models nonlinear

### ** Examples

## Apply a list of different sigmoidal models to data
## and analyze GOF statistics with Akaike weights
## on 8 different sigmoidal models.
modList <- list(l7, l6, l5, l4, b7, b6, b5, b4)
aics <- sapply(modList, function(x) AIC(pcrfit(reps, 1, 2, x))) 
akaike.weights(aics)$weights 



