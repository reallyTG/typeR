library(plsRbeta)


### Name: PLS_beta
### Title: Partial least squares Regression generalized linear models
### Aliases: PLS_beta
### Keywords: models regression

### ** Examples


data("GasolineYield",package="betareg")
yGasolineYield <- GasolineYield$yield
XGasolineYield <- GasolineYield[,2:5]
modpls <- PLS_beta(yGasolineYield,XGasolineYield,nt=3,modele="pls-beta")
modpls$uscores
modpls$pp
modpls$Coeffs
modpls$Std.Coeffs
modpls$InfCrit
modpls$PredictY[1,]
rm("modpls")




