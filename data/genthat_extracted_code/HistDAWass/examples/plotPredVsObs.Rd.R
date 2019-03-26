library(HistDAWass)


### Name: plotPredVsObs
### Title: A function for comparing observed vs predicted histograms
### Aliases: plotPredVsObs

### ** Examples

## do a regression
pars=WH.regression.two.components(BLOOD,Yvar = 1,Xvars = c(2:3))
## predict data
PRED=WH.regression.two.components.predict(data = BLOOD[,2:3],parameters = pars)
## define observed data
## Not run: 
##D OBS=BLOOD[,1]
##D plotPredVsObs(PRED,OBS,"HISTO")
##D plotPredVsObs(PRED,OBS,"CDF")
##D plotPredVsObs(PRED,OBS,"DENS")
## End(Not run)



