library(ensembleBMA)


### Name: MAE
### Title: Mean Absolute Error
### Aliases: MAE MAE.default
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

  MAE( tempTestFit, tempTestData)



