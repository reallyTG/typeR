library(ensembleBMA)


### Name: controlBMAgamma0
### Title: Control parameters for BMA precipitation modeling
### Aliases: controlBMAgamma0
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
##D   prcpTestFit1 <- ensembleBMAgamma0( prcpTestData, trainingDays = 30,
##D        control = controlBMAgamma0(power = (1/4)))
## End(Not run)

# for quick run only; use more training days for forecasting
  prcpTestFit1 <- ensembleBMAgamma0( prcpTestData[1:14,], trainingDays = 6,
       control = controlBMAgamma0(power = (1/4)))



