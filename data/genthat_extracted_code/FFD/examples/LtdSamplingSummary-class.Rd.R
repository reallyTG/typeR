library(FFD)


### Name: LtdSamplingSummary-class
### Title: Class "LtdSamplingSummary"
### Aliases: LtdSamplingSummary-class HTML,LtdSamplingSummary-method
###   plot,LtdSamplingSummary-method show,LtdSamplingSummary-method
###   summary,LtdSamplingSummary-method
### Keywords: classes

### ** Examples

## Show the structure of the class:
showClass("LtdSamplingSummary")
## Create an object:
data(sheepData)
mySurvey <- surveyData(nAnimalVec = sheepData$nSheep, 
    populationData = sheepData, designPrevalence = 0.002, 
    alpha = 0.05, intraHerdPrevalence = 0.13,
    diagSensitivity = 0.9, costHerd = 30, costAnimal = 7.1)
myLtdSamplingSummary <- ltdSamplingSummary(survey.Data = mySurvey, 
    sampleSizeLtdMax = 7)
## Display results:
summary(myLtdSamplingSummary)
plot(myLtdSamplingSummary)
## Write results to an html-file:
## Not run: 
##D target <- HTMLInitFile(getwd(), filename = "LtdSampling")
##D HTML(myLtdSamplingSummary)
##D HTMLEndFile()
## End(Not run)



