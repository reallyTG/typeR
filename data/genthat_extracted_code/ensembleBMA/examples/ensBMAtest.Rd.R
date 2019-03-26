library(ensembleBMA)


### Name: ensBMAtest
### Title: Ensemble BMA Test Data Set
### Aliases: ensBMAtest tempTestFit prcpTestFit winsTestFit
### Keywords: datasets

### ** Examples

## Not run: 
##D # R check
##D 
##D   data(ensBMAtest)
##D 
##D   ensMemNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")
##D 
##D #----------------------------------------------------------------------------
##D 
##D   obs <- paste("T2","obs", sep = ".")
##D   ens <- paste("T2", ensMemNames, sep = ".")
##D 
##D   tempTestData <- ensembleData( forecasts = ensBMAtest[,ens],
##D                                 dates = ensBMAtest[,"vdate"],
##D                                 observations = ensBMAtest[,obs],
##D                                 station = ensBMAtest[,"station"],
##D                                 forecastHour = 48,
##D                                 initializationTime = "00")
##D 
##D   tempTestFit <- ensembleBMAnormal( tempTestData, trainingDays = 30)
##D 
##D   MAE( tempFit, tempTestData)
##D   CRPS( tempFit, tempTestData)
##D 
##D #----------------------------------------------------------------------------
##D 
##D   obs <- paste("PCP24","obs", sep = ".")
##D   ens <- paste("PCP24", ensMemNames, sep = ".")
##D 
##D   prcpTestData <- ensembleData( forecasts = ensBMAtest[,ens],
##D                                 dates = ensBMAtest[,"vdate"], 
##D                                 observations = ensBMAtest[,obs], 
##D                                 station = ensBMAtest[,"station"],
##D                                 forecastHour = 48,
##D                                 initializationTime = "00")
##D 
##D   prcpTestFit <- ensembleBMAgamma0( prcpTestData, trainingDays = 30)
##D 
##D   MAE( prcpTestFit, prcpTestData)
##D   CRPS( prcpTestFit, prcpTestData)
##D 
##D #----------------------------------------------------------------------------
##D 
##D   obs <- paste("MAXWSP10","obs", sep = ".")
##D   ens <- paste("MAXWSP10", ensMemNames, sep = ".")
##D 
##D   winsTestData <- ensembleData( forecasts = ensBMAtest[,ens],
##D                                 dates = ensBMAtest[,"vdate"], 
##D                                 observations = ensBMAtest[,obs],
##D                                 station = ensBMAtest[,"station"],
##D                                 forecastHour = 48,
##D                                 initializationTime = "00")
##D 
##D    winsTestFit <- ensembleBMAgamma(winsTestData, trainingDays = 30)
##D 
##D    MAE( winsTestFit, winsTestData)
##D    CRPS( winsTestFit, winsTestData)
## End(Not run)


