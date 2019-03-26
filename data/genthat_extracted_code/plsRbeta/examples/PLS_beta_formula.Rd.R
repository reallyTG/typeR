library(plsRbeta)


### Name: PLS_beta_formula
### Title: Partial least squares Regression generalized linear models
### Aliases: PLS_beta_formula
### Keywords: models regression

### ** Examples


data("GasolineYield",package="betareg")
modpls <- PLS_beta_formula(yield~.,data=GasolineYield,nt=3,modele="pls-beta")
modpls$uscores
modpls$pp
modpls$Coeffs
modpls$Std.Coeffs
modpls$InfCrit
modpls$PredictY[1,]
rm("modpls")




