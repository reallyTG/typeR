library(ensembleBMA)


### Name: modelParameters
### Title: Extract model parameters
### Aliases: modelParameters modelParameters.ensembleBMAgamma
###   modelParameters.ensembleBMAgamma0 modelParameters.ensembleBMAnormal
###   modelParameters.fitBMAgamma modelParameters.fitBMAgamma0
###   modelParameters.fitBMAnormal
### Keywords: models

### ** Examples

  data(ensBMAtest)

  ensMemNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")

  obs <- paste("T2","obs", sep = ".")
  ens <- paste("T2", ensMemNames, sep = ".")

  tempTestData <- ensembleData( forecasts = ensBMAtest[,ens],
                                dates = ensBMAtest[,"vdate"],
                                observations = ensBMAtest[,obs],
                                station = ensBMAtest[,"station"],
                                forecastHour = 48,
                                initializationTime = "00")

## Not run: 
##D  # R check
##D   tempTestFit <- ensembleBMAnormal( tempTestData, trainingDays = 30)
## End(Not run)

  modelParameters( tempTestFit, date = "2008010100")

  tempTrain <- trainingData( tempTestData, date = "2008010100",
                             trainingDays = tempTestFit$training$days)

  tempTrainFit <- fitBMAnormal( tempTrain)

  modelParameters( tempTrainFit)



