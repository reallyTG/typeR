library(ensembleBMA)


### Name: controlBMAgamma
### Title: Control parameters for BMA wind speed modeling
### Aliases: controlBMAgamma
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
##D    winsTestFit1 <- ensembleBMAgamma(winsTestData, trainingDays = 30,
##D        control = controlBMAgamma(maxIter = 100, tol = 1.e-6,
##D    startupSpeed =1))
## End(Not run)

# for quick run only; use more training days for forecasting
   winsTestFit1 <- ensembleBMAgamma(winsTestData[1:14,], trainingDays = 5,
      control = controlBMAgamma(maxIter = 100, tol = 1.e-6, startupSpeed = 1))



