library(ensembleMOS)


### Name: fitMOS
### Title: EMOS model fit to a training set
### Aliases: fitMOS
### Keywords: models

### ** Examples

data("ensBMAtest", package = "ensembleBMA")

ensMemNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")

obs <- paste("T2", "obs", sep = ".")
ens <- paste("T2", ensMemNames, sep = ".")
tempTestData <- ensembleData(forecasts = ensBMAtest[,ens],
                             dates = ensBMAtest[,"vdate"],
                             observations = ensBMAtest[,obs],
                             station = ensBMAtest[,"station"],
                             forecastHour = 48,
                             initializationTime = "00")

tempTrain <- trainingData(tempTestData, trainingDays = 30,
                          date  = "2008010100")

tempTrainFit <- fitMOS(tempTrain, model = "normal")

## equivalent to
##    tempTrainFit <- fitMOSnormal(tempTrain)



