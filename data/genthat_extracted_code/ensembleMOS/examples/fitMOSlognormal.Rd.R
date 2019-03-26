library(ensembleMOS)


### Name: fitMOSlognormal
### Title: Log-normal EMOS model fit to a training set
### Aliases: fitMOSlognormal
### Keywords: models

### ** Examples

data("ensBMAtest", package = "ensembleBMA")

ensMemNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")

obs <- paste("MAXWSP10","obs", sep = ".")
ens <- paste("MAXWSP10", ensMemNames, sep = ".")
windTestData <- ensembleData(forecasts = ensBMAtest[,ens],
                             dates = ensBMAtest[,"vdate"],
                             observations = ensBMAtest[,obs],
                             station = ensBMAtest[,"station"],
                             forecastHour = 48,
                             initializationTime = "00")
                             
windTrain <- trainingData(windTestData, trainingDays = 30,
                          date = "2008010100")

windTestFit <- fitMOSlognormal(windTrain)



