library(EBMAforecast)


### Name: compareModels
### Title: Function for comparing multiple models based on predictive
###   performance
### Aliases: CompareModels-class compareModels
###   compareModels,ForecastData-method

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
##D 
##D compareModels(this.ensemble,"calibration")
##D 
##D compareModels(this.ensemble,"test") 
## End(Not run)




