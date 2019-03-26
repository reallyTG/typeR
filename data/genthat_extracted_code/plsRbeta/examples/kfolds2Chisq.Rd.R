library(plsRbeta)


### Name: kfolds2Chisq
### Title: Computes Predicted Chisquare for kfold cross validated partial
###   least squares regression models.
### Aliases: kfolds2Chisq
### Keywords: models regression

### ** Examples

## Not run: 
##D data("GasolineYield",package="betareg")
##D yGasolineYield <- GasolineYield$yield
##D XGasolineYield <- GasolineYield[,2:5]
##D bbb <- PLS_beta_kfoldcv(yGasolineYield,XGasolineYield,nt=3,modele="pls-beta")
##D kfolds2Chisq(bbb)
## End(Not run)



