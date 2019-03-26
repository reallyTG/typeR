library(FFD)


### Name: LtdSampling-class
### Title: Class "LtdSampling"
### Aliases: LtdSampling-class HTML,LtdSampling-method
###   sample,LtdSampling-method show,LtdSampling-method
###   summary,LtdSampling-method
### Keywords: classes

### ** Examples

## Show the structure of the class:
showClass("LtdSampling")
## Create an object:
data(sheepData)
mySurvey <- surveyData(nAnimalVec = sheepData$nSheep, 
    populationData = sheepData, designPrevalence = 0.002, 
    alpha = 0.05, intraHerdPrevalence = 0.13,
    diagSensitivity = 0.9, costHerd = 30, costAnimal = 7.1)
myLtdSampling <- ltdSampling(survey.Data = mySurvey, sampleSizeLtd = 7)
## Display results:
summary(myLtdSampling)
## Write results to an html-file:
## Not run: 
##D target <- HTMLInitFile(getwd(), filename = "LtdSampling")
##D HTML(myLtdSampling)
##D HTMLEndFile()
## End(Not run)



