library(ensembleBMA)


### Name: ensembleBMAgamma
### Title: BMA wind speed modeling
### Aliases: ensembleBMAgamma [.ensembleBMAgamma
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
                                forecastHour = 48,
                                initializationTime = "00")

## Not run: 
##D  # R check
##D   winsTestFit <- ensembleBMAgamma(winsTestData, trainingDays = 30, 
##D                                   control = controlBMAgamma(startupSpeed = 1))
##D 
##D ## equivalent to
##D ##     winsTestFit <- ensembleBMA(winsTestData, trainingDays = 30,
##D ##                                model = "gamma")
## End(Not run)

# for quick run only; use more training days for forecasting
   winsTestFit <- ensembleBMAgamma(winsTestData[1:14,], trainingDays = 5,
                            control = controlBMAgamma(startupSpeed = 1))



