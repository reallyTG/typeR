library(spls)


### Name: predict.splsda
### Title: Make predictions or extract coefficients from a fitted SPLSDA
###   model
### Aliases: predict.splsda coef.splsda
### Keywords: models multivariate methods

### ** Examples

data(prostate)
# SPLSDA with eta=0.8 & 3 hidden components
f <- splsda( prostate$x, prostate$y, K=3, eta=0.8, scale.x=FALSE )
# Print out coefficients
coef.f <- coef(f)
coef.f[ coef.f!=0, ]
# Prediction on the training dataset
(pred.f <- predict( f, type="fit" ))



