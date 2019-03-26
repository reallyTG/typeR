library(plsRbeta)


### Name: print.plsRbetamodel
### Title: Print method for plsRbeta models
### Aliases: print.plsRbetamodel
### Keywords: methods print

### ** Examples

data("GasolineYield",package="betareg")
modpls <- plsRbeta(yield~.,data=GasolineYield,nt=3,modele="pls-beta")
print(modpls)



