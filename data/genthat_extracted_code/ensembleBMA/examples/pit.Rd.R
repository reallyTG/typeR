library(ensembleBMA)


### Name: pit
### Title: Probability Integral Transform for ensemble forcasting models
### Aliases: pit pit.ensembleBMAgamma pit.ensembleBMAgamma0
###   pit.ensembleBMAnormal pit.fitBMAgamma pit.fitBMAgamma0
###   pit.fitBMAnormal
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

  tempTestForc <- quantileForecast( tempTestFit, tempTestData)
  range(tempTestForc)

  tempTestPIT <- pit( tempTestFit, tempTestData) 




