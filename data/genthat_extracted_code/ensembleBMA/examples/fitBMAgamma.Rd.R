library(ensembleBMA)


### Name: fitBMAgamma
### Title: BMA wind speed model fit to a training set
### Aliases: fitBMAgamma inverseLogit
### Keywords: models

### ** Examples

  data(ensBMAtest)

  ensMemNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")
  
  obs <- paste("MAXWSP10","obs", sep = ".")
  ens <- paste("MAXWSP10", ensMemNames, sep = ".")

  winsTestData <- ensembleData( forecasts = ensBMAtest[,ens],
                                dates = ensBMAtest[,"vdate"], 
                                observations = ensBMAtest[,obs],
                                station = ensBMAtest[,"station"],
                                startupSpeed = 1,
                                forecastHour = 48,
                                initializationTime = "00")

## Not run: 
##D  # R check
##D   winsTrain <- trainingData( winsTestData, trainingDays = 30,
##D                              date = "2008010100")
## End(Not run)

# for quick run only; use more training days for forecasting
  winsTrain <- trainingData( winsTestData, trainingDays = 10,
                             date = "2008010100")

  winsTrainFit <- fitBMAgamma( winsTrain)

## equivalent to
##    winsTrainFit <- fitBMA( winsTrain, model = "gamma")



