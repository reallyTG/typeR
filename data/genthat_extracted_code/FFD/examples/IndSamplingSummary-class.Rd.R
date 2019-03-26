library(FFD)


### Name: IndSamplingSummary-class
### Title: Class "IndSamplingSummary"
### Aliases: IndSamplingSummary-class HTML,IndSamplingSummary-method
###   plot,IndSamplingSummary-method show,IndSamplingSummary-method
###   summary,IndSamplingSummary-method
### Keywords: classes

### ** Examples

## Show the structure of the class:
showClass("IndSamplingSummary")
## Create an object:
data(sheepData)
mySurvey <- surveyData(nAnimalVec = sheepData$nSheep, 
    populationData = sheepData, designPrevalence = 0.002, 
    alpha = 0.05, intraHerdPrevalence = 0.13,
    diagSensitivity = 0.9, costHerd = 15, costAnimal = 20)
myIndSamplingSummary <- indSamplingSummary(survey.Data = mySurvey, 
    stepSize = 0.06)
## Display results:
summary(myIndSamplingSummary)
plot(myIndSamplingSummary)
## Write results to an html-file:
## Not run: 
##D target <- HTMLInitFile(getwd(), filename = "ItdSampling")
##D HTML(myIndSamplingSummary)
##D HTMLEndFile()
## End(Not run)



