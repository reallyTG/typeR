library(ensembleBMA)


### Name: plot.ensembleBMA
### Title: Plot the Predictive Distribution Function for ensemble
###   forcasting models
### Aliases: plot.ensembleBMA plot.ensembleBMAgamma plot.ensembleBMAgamma0
###   plot.ensembleBMAnormal plot.fitBMA plot.fitBMAgamma plot.fitBMAgamma0
###   plot.fitBMAnormal plotBMAgamma plotBMAgamma0 plotBMAnormal
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
##D # R check
##D   tempTestFit <- ensembleBMAnormal( tempTestData, trainingDays = 30)
##D   plot(tempTestFit, tempTestData)
## End(Not run)




