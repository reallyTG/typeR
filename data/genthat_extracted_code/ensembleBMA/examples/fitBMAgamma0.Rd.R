library(ensembleBMA)


### Name: fitBMAgamma0
### Title: BMA precipitation model fit to a training set
### Aliases: fitBMAgamma0
### Keywords: models

### ** Examples

  data(ensBMAtest)

  ensMemNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")

  obs <- paste("PCP24","obs", sep = ".")
  ens <- paste("PCP24", ensMemNames, sep = ".")

  prcpTestData <- ensembleData( forecasts = ensBMAtest[,ens],
                                dates = ensBMAtest[,"vdate"], 
                                observations = ensBMAtest[,obs], 
                                station = ensBMAtest[,"station"],
                                forecastHour = 48,
                                initializationTime = "00")

## Not run: 
##D  # R check
##D   prcpTrain <- trainingData( prcpTestData, trainingDays = 30,
##D                              date = "2008010100")
## End(Not run)

# quick run only; use more training days for forecasting
  prcpTrain <- trainingData( prcpTestData, trainingDays = 10,
                             date = "2008010100")

  prcpTrainFit <- fitBMAgamma0( prcpTrain)

## equivalent to
##    prcpTrainFit <- fitBMA( prcpTrain, model = "gamma0")




