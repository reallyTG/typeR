library(ensembleBMA)


### Name: cdf
### Title: Cummulative Distribution Function for ensemble forcasting models
### Aliases: cdf cdf.ensembleBMAgamma cdf.ensembleBMAgamma0
###   cdf.ensembleBMAnormal cdf.fitBMAgamma cdf.fitBMAgamma0
###   cdf.fitBMAnormal cdfBMAgamma cdfBMAgamma0 cdfBMAnormal
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
## End(Not run)

# for quick run only; use more training days for forecasting
  tempTestFit <- ensembleBMAnormal( tempTestData[1:20,], trainingDays = 8)

  tempTestForc <- quantileForecast( tempTestFit, tempTestData)
  range(tempTestForc)

  tempTestCDF <- cdf( tempTestFit, tempTestData, 
                      values = seq(from=277, to=282, by = 1))

  tempTestCDF



