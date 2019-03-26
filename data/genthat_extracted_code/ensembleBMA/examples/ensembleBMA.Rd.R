library(ensembleBMA)


### Name: ensembleBMA
### Title: BMA mixture model fit
### Aliases: ensembleBMA getDates getExchangeable matchDates match2side
###   modelDates modelDates.default modelMembers modelMembers.default
###   matchEnsembleMembers matchEnsembleMembers.ensembleBMAgamma
###   matchEnsembleMembers.ensembleBMAgamma0
###   matchEnsembleMembers.ensembleBMAnormal
###   matchEnsembleMembers.fitBMAgamma matchEnsembleMembers.fitBMAgamma0
###   matchEnsembleMembers.fitBMAnormal
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
##D  # R checl
##D   tempTestFit <- ensembleBMA( tempTestData, trainingDays = 30,
##D                               model = "normal")
##D 
##D ## equivalent to
##D ##    tempTestFit <- ensembleBMAnormal( tempTestData, trainingDays = 30)
## End(Not run)

# for quick run only; use more training days for forecasting
  tempTestFit <- ensembleBMA( tempTestData[1:20,], trainingDays = 8,
                              model = "normal")



