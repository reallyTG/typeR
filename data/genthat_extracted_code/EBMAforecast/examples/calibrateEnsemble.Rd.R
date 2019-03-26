library(EBMAforecast)


### Name: calibrateEnsemble
### Title: Calibrate an ensemble Bayesian Model Averaging model
### Aliases: FDatFitLogit-class FDatFitNormal-class ForecastDataLogit-class
###   ForecastDataNormal-class calibrateEnsemble
###   calibrateEnsemble,ForecastData-method fitEnsemble
###   fitEnsemble,ForecastData-method fitEnsemble,ForecastDataLogit-method
###   fitEnsemble,ForecastDataNormal-method
### Keywords: EBMA calibrate

### ** Examples

## Not run: 
##D data(calibrationSample)
##D 
##D data(testSample) 
##D 
##D this.ForecastData <- makeForecastData(.predCalibration=calibrationSample[,c("LMER", "SAE", "GLM")],
##D .outcomeCalibration=calibrationSample[,"Insurgency"],.predTest=testSample[,c("LMER", "SAE", "GLM")],
##D .outcomeTest=testSample[,"Insurgency"], .modelNames=c("LMER", "SAE", "GLM"))
##D 
##D this.ensemble <- calibrateEnsemble(this.ForecastData, model="logit", tol=0.001, exp=3)
## End(Not run)




