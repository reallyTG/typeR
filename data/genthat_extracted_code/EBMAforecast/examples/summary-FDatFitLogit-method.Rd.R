library(EBMAforecast)


### Name: summary,FDatFitLogit-method
### Title: Summary Function
### Aliases: SummaryForecastData-class print,SummaryForecastData-method
###   show,SummaryForecastData-method summary,FDatFitLogit-method
###   summary,FDatFitNormal-method

### ** Examples

## Not run: 
##D  data(calibrationSample)
##D 
##D data(testSample) 
##D 
##D this.ForecastData <- makeForecastData(.predCalibration=calibrationSample[,c("LMER", "SAE", "GLM")],
##D .outcomeCalibration=calibrationSample[,"Insurgency"],.predTest=testSample[,c("LMER", "SAE", "GLM")],
##D .outcomeTest=testSample[,"Insurgency"], .modelNames=c("LMER", "SAE", "GLM"))
##D 
##D this.ensemble <- calibrateEnsemble(this.ForecastData, model="logit", tol=0.001,exp=3)
##D 
##D summary(this.ensemble, period="calibration") 
##D 
##D summary(this.ensemble, period="test",showCoefs=FALSE)
## End(Not run)




