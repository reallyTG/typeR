library(plsRbeta)


### Name: print.summary.plsRbetamodel
### Title: Print method for summaries of plsRbeta models
### Aliases: print.summary.plsRbetamodel
### Keywords: methods print

### ** Examples

data("GasolineYield",package="betareg")
modpls <- plsRbeta(yield~.,data=GasolineYield,nt=3,modele="pls-beta")
print(summary(modpls))



