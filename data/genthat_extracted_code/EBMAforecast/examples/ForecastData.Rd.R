library(EBMAforecast)


### Name: ForecastData-class
### Title: An ensemble forecasting data object
### Aliases: ForecastData-class setModelNames<-
###   setModelNames<-,ForecastData-method setOutcomeCalibration<-
###   setOutcomeCalibration<-,ForecastData-method setOutcomeTest<-
###   setOutcomeTest<-,ForecastData-method setPredCalibration<-
###   setPredCalibration<-,ForecastData-method setPredTest<-
###   setPredTest<-,ForecastData-method

### ** Examples

## Not run: 
##D  data(calibrationSample)
##D 
##D data(testSample) 
##D this.ForecastData <- makeForecastData(.predCalibration=calibrationSample[,c("LMER", "SAE", "GLM")],
##D .outcomeCalibration=calibrationSample[,"Insurgency"],.predTest=testSample[,c("LMER", "SAE", "GLM")],
##D .outcomeTest=testSample[,"Insurgency"], .modelNames=c("LMER", "SAE", "GLM"))
##D 
##D ### to acces individual slots in the ForecastData object
##D getPredCalibration(this.ForecastData)
##D getOutcomeCalibration(this.ForecastData)
##D getPredTest(this.ForecastData)
##D getOutcomeTest(this.ForecastData)
##D getModelNames(this.ForecastData)
##D 
##D ### to assign individual slots, use set functions
##D 
##D setPredCalibration(this.ForecastData)<-calibrationSample[,c("LMER", "SAE", "GLM")]
##D setOutcomeCalibration(this.ForecastData)<-calibrationSample[,"Insurgency"]
##D setPredTest(this.ForecastData)<-testSample[,c("LMER", "SAE", "GLM")]
##D setOutcomeTest(this.ForecastData)<-testSample[,"Insurgency"]
##D setModelNames(this.ForecastData)<-c("LMER", "SAE", "GLM")
## End(Not run)



