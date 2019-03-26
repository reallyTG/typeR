library(plsRbeta)


### Name: summary.plsRbetamodel
### Title: Summary method for plsRbeta models
### Aliases: summary.plsRbetamodel
### Keywords: methods print

### ** Examples

data("GasolineYield",package="betareg")
modpls <- plsRbeta(yield~.,data=GasolineYield,nt=3,modele="pls-beta")
summary(modpls)



