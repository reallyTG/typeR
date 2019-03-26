library(psychotools)


### Name: btmodel
### Title: Bradley-Terry Model Fitting Function
### Aliases: btmodel btReg.fit print.btmodel summary.btmodel
###   print.summary.btmodel coef.btmodel worth.btmodel deviance.btmodel
###   logLik.btmodel vcov.btmodel estfun.btmodel
### Keywords: regression

### ** Examples

o <- options(digits = 4)

## data
data("GermanParties2009", package = "psychotools")

## Bradley-Terry model
bt <- btmodel(GermanParties2009$preference)
summary(bt)
plot(bt)

options(digits = o$digits)



