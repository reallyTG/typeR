library(FFD)


### Name: IndSampling-class
### Title: Class "IndSampling"
### Aliases: IndSampling-class HTML,IndSampling-method
###   sample,IndSampling-method show,IndSampling-method
###   summary,IndSampling-method
### Keywords: classes

### ** Examples

## Show the structure of the class:
showClass("IndSampling")
## Create an object:
data(sheepData)
mySurvey <- surveyData(nAnimalVec = sheepData$nSheep, 
    populationData = sheepData, designPrevalence = 0.002, 
    alpha = 0.05, intraHerdPrevalence = 0.13,
    diagSensitivity = 0.9, costHerd = 30, costAnimal = 7.1)
myIndSampling <- indSampling(survey.Data = mySurvey, herdSensitivity = 0.7)
## Display results:
summary(myIndSampling)
## Write results to an html-file:
## Not run: 
##D target <- HTMLInitFile(getwd(), filename = "IndSampling")
##D HTML(myIndSampling)
##D HTMLEndFile()
## End(Not run)



