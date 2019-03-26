library(ensembleBMA)


### Name: fitBMA
### Title: BMA model fit to a training set
### Aliases: fitBMA
### Keywords: models

### ** Examples

  data(ensBMAtest)

  ensNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")

  obs <- paste("T2","obs", sep = ".")
  ens <- paste("T2", ensNames, sep = ".")


  tempTestData <- ensembleData( forecasts = ensBMAtest[,ens],
                                observations = ensBMAtest[,obs],
                                station = ensBMAtest[,"station"],
                                dates = ensBMAtest[,"vdate"],
                                forecastHour = 48,
                                initializationTime = "00")

  tempTrain <- trainingData( tempTestData, trainingDays = 30,
                             date  = "2008010100")

  tempTrainFit <- fitBMA( tempTrain, model = "normal")

## equivalent to
##    tempTrainFit <- fitBMAnormal( tempTrain)




