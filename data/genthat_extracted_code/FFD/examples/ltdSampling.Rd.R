library(FFD)


### Name: ltdSampling
### Title: Constructor for class 'LtdSampling'.
### Aliases: ltdSampling
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
## Limited sampling without risk groups:    
myLtdSampling <- ltdSampling(survey.Data = mySurvey, sampleSizeLtd = 7)
## Limited sampling with risk groups: 
myLtdSamplingRG <- ltdSampling(survey.Data = mySurvey, sampleSizeLtd = 7, 
	nSampleFixVec = NULL, probVec = c(1,4))



