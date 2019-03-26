library(spls)


### Name: predict.spls
### Title: Make predictions or extract coefficients from a fitted SPLS
###   model
### Aliases: predict.spls coef.spls
### Keywords: regression multivariate methods

### ** Examples

data(yeast)
# SPLS with eta=0.7 & 8 latent components
f <- spls( yeast$x, yeast$y, K=8, eta=0.7 )
# Coefficient estimates of the SPLS fit
coef.f <- coef(f)
coef.f[1:5,]
# Prediction on the training dataset
pred.f <- predict( f, type="fit" )
pred.f[1:5,]



