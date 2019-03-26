library(EBMAforecast)


### Name: makeForecastData
### Title: Build a ensemble forecasting data object
### Aliases: ForecastData-generic ForecastData-method makeForecastData
###   makeForecastData,ANY-method makeForecastData-method,
###   print,ForecastData-method print-method, setModelNames<-,
###   setOutcomeCalibration, setOutcomeTest<-, setPredCalibration,
###   setPredTest, show,ForecastData-method show-method

### ** Examples

 data(calibrationSample)

## Not run: 
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




