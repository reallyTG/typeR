library(spls)


### Name: predict.sgpls
### Title: Make predictions or extract coefficients from a fitted SGPLS
###   model
### Aliases: predict.sgpls coef.sgpls
### Keywords: models multivariate methods

### ** Examples

data(prostate)
# SGPLS with eta=0.55 & 3 hidden components
f <- sgpls( prostate$x, prostate$y, K=3, eta=0.55, scale.x=FALSE )
# Print out coefficients
coef.f <- coef(f)
coef.f[ coef.f!=0, ]
# Prediction on the training dataset
(pred.f <- predict( f, type="fit" ))



