library(plsRbeta)


### Name: PLS_beta_wvc
### Title: Light version of PLS\_beta for cross validation purposes
### Aliases: PLS_beta_wvc
### Keywords: models regression

### ** Examples


data("GasolineYield",package="betareg")
yGasolineYield <- GasolineYield$yield
XGasolineYield <- GasolineYield[,2:5]
modpls <- PLS_beta_wvc(yGasolineYield,XGasolineYield,nt=3,modele="pls-beta")
modpls
rm("modpls")




