library(EBMAforecast)


### Name: plot,FDatFitLogit-method
### Title: Plotting function for ensemble models of the class
###   "FDatFitLogit" or "FDatFitNormal", which are the objects created by
###   the 'calibrateEnsemble()' function.
### Aliases: plot,FDatFitLogit-method plot,FDatFitNormal-method

### ** Examples

data(calibrationSample)

data(testSample) 

this.ForecastData <- makeForecastData(.predCalibration=calibrationSample[,c("LMER", "SAE", "GLM")],
.outcomeCalibration=calibrationSample[,"Insurgency"],.predTest=testSample[,c("LMER", "SAE", "GLM")],
.outcomeTest=testSample[,"Insurgency"], .modelNames=c("LMER", "SAE", "GLM"))

this.ensemble <- calibrateEnsemble(this.ForecastData, model="logit", tol=0.001, exp=3)

plot(this.ensemble, period="calibration") 
plot(this.ensemble, period="test")




