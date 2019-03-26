library(FFD)


### Name: ltdSamplingSummary
### Title: Constructor for class 'LtdSamplingSummary'.
### Aliases: ltdSamplingSummary
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
myLtdSamplingSummary <- ltdSamplingSummary(survey.Data = mySurvey, 
    sampleSizeLtdMax = 10)
## Limited sampling with risk groups: 
myLtdSamplingRG <- ltdSamplingSummary(survey.Data = mySurvey, 
    sampleSizeLtdMax = 10, nSampleFixVec = NULL, probVec = c(1,4))



