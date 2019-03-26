library(FFD)


### Name: indSampling
### Title: Constructor for class 'IndSampling'.
### Aliases: indSampling
### Keywords: methods

### ** Examples

data(sheepData)
sheepData$size <- ifelse(sheepData$nSheep < 30, "small", "large")
riskValueData <- data.frame(riskGroup = c("small", "large"), 
    riskValues = c(1,2))
mySurvey <- surveyData(nAnimalVec = sheepData$nSheep,
		riskGroupVec = sheepData$size,
		riskValueData = riskValueData,
		populationData = sheepData, designPrevalence = 0.002,
		alpha = 0.05, intraHerdPrevalence = 0.13,
		diagSensitivity = 0.9, costHerd = 30, costAnimal = 7.1)
## Individual sampling without risk groups:    
myIndSampling <- indSampling(survey.Data = mySurvey, 
    herdSensitivity = 0.7)
## Individual sampling with risk groups:    
myIndSamplingRG <- indSampling(survey.Data = mySurvey, 
    herdSensitivity = 0.7, nSampleFixVec = NULL, probVec = c(1,4))



