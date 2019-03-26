library(FFD)


### Name: SurveyData-class
### Title: Class "SurveyData"
### Aliases: SurveyData-class show,SurveyData-method
###   summary,SurveyData-method
### Keywords: classes

### ** Examples

## Show the structure of the class:
showClass("SurveyData")
## Create an object:
data(sheepData)
mySurvey <- surveyData(nAnimalVec = sheepData$nSheep, 
    populationData = sheepData, designPrevalence = 0.002, 
    alpha = 0.05, intraHerdPrevalence = 0.13,
    diagSensitivity = 0.9, costHerd = 30, costAnimal = 7.1)
## Display results:
summary(mySurvey)



