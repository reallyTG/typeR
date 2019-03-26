library(FFD)


### Name: surveyData
### Title: Constructor for class 'SurveyData'.
### Aliases: surveyData
### Keywords: methods

### ** Examples

data(sheepData)
mySurvey <- surveyData(nAnimalVec = sheepData$nSheep, 
    populationData = sheepData, designPrevalence = 0.002, 
    alpha = 0.05, intraHerdPrevalence = 0.13,
    diagSensitivity = 0.9, costHerd = 30, costAnimal = 7.1)



