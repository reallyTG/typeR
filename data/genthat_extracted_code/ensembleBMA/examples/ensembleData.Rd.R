library(ensembleBMA)


### Name: ensembleData
### Title: Create an ensembleData object
### Aliases: ensembleData dataNA dataNobs dataObsLabels dataStartupSpeed
###   dataVerifObs ensembleForecasts ensembleFhour ensembleGroups
###   ensembleItime ensembleMembers ensembleSize ensembleValidDates
###   dataObsLabels.ensembleData dataNA.ensembleData dataNobs.ensembleData
###   dataStartupSpeed.ensembleData dataVerifObs.ensembleData
###   ensembleMembers.ensembleData ensembleFhour.ensembleData
###   ensembleForecasts.ensembleData ensembleGroups.ensembleData
###   ensembleItime.ensembleData ensembleSize.ensembleData
###   ensembleValidDates.ensembleData [.ensembleData
###   matchEnsembleMembers.default matchITandFH matchITandFH.default
###   startupSpeed startupSpeed.ensembleData
### Keywords: data

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
##D 
##D   tempTestFit <- ensembleBMAnormal( tempTestData, trainingDays = 30)
##D 
## End(Not run)

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
##D 
##D   prcpTestFit <- ensembleBMAgamma0( prcpTestData, trainingDays = 30)
##D 
## End(Not run)

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
##D 
##D  winsTestFit <- ensembleBMAgamma(winsTestData, trainingDays = 30)
##D 
## End(Not run)




