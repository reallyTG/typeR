library(ensembleBMA)


### Name: ensembleBMAgamma0
### Title: BMA precipitation modeling
### Aliases: ensembleBMAgamma0 [.ensembleBMAgamma0
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
##D   prcpTestFit <- ensembleBMAgamma0( prcpTestData, trainingDays = 30)
##D 
##D ## equivalent to
##D ##    prcpTestFit <- ensembleBMA( prcpTestData, trainingDays = 30,
##D ##                                model = "gamma0")
## End(Not run)

# for quick run only; use more training days for forecasting
  prcpTestFit <- ensembleBMAgamma0( prcpTestData[3:16,], trainingDays = 6)



