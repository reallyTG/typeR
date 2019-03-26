library(systemfit)


### Name: createSystemfitModel
### Title: Create a Model for systemfit
### Aliases: createSystemfitModel
### Keywords: models

### ** Examples

## create a model by random numbers
systemfitModel <- createSystemfitModel( 3, 4, 100 )

## estimate this model by "SUR"
fitsur <- systemfit( systemfitModel$formula, "SUR", data = systemfitModel$data )

## compare the "true" and the estimated coefficients
cbind( systemfitModel$coef, coef( fitsur ) )



