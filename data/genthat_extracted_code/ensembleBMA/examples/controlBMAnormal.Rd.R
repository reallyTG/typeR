library(ensembleBMA)


### Name: controlBMAnormal
### Title: Control parameters for BMA mixtures of normals
### Aliases: controlBMAnormal
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
##D   tempTestFit1 <- ensembleBMAnormal(tempTestData, trainingDays = 30,
##D     control = controlBMAnormal(maxIter = 100, biasCorrection = "additive"))
## End(Not run)

# for quick run only; use more training days for forecasting
  tempTestFit1 <- ensembleBMAnormal(tempTestData[1:20,], trainingDays = 5,
    control = controlBMAnormal(maxIter = 100, biasCorrection = "additive"))




