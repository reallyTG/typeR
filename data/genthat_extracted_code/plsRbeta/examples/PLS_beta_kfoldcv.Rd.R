library(plsRbeta)


### Name: PLS_beta_kfoldcv
### Title: Partial least squares regression beta models with kfold cross
###   validation
### Aliases: PLS_beta_kfoldcv
### Keywords: models regression

### ** Examples

## Not run: 
##D data("GasolineYield",package="betareg")
##D yGasolineYield <- GasolineYield$yield
##D XGasolineYield <- GasolineYield[,2:5]
##D bbb <- PLS_beta_kfoldcv(yGasolineYield,XGasolineYield,nt=3,modele="pls-beta")
##D kfolds2CVinfos_beta(bbb)
## End(Not run)



