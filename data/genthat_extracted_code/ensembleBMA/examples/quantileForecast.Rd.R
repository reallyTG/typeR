library(ensembleBMA)


### Name: quantileForecast
### Title: Quantile forecasts at observation locations
### Aliases: quantileForecast quantileForecast.ensembleBMAgamma
###   quantileForecast.ensembleBMAgamma0 quantileForecast.ensembleBMAnormal
###   quantileForecast.ensembleBMAbvnormal quantileForecast.fitBMAgamma
###   quantileForecast.fitBMAgamma0 quantileForecast.fitBMAnormal
###   quantileForecast.fitBMAbvnormal quantBMAgamma quantBMAgamma0
###   quantBMAnormal
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


## Not run: 
##D  # R check
##D 
##D   data(srft)
##D 
##D   labels <- c("CMCG","ETA","GASP","GFS","JMA","NGPS","TCWB","UKMO")
##D 
##D   srftData <- ensembleData( forecasts = srft[ ,labels],
##D                             dates = srft$date,
##D                             observations = srft$obs,
##D                             latitude = srft$lat,
##D                             longitude = srft$lon,
##D                             forecastHour = 48,
##D                             initializationTime = "00")
##D 
##D   srftFit <- ensembleBMAnormal(srftData, date = "2004013100",
##D                                trainingDays = 25)
##D 
##D   data(srftGrid)
##D 
##D   srftGridData <- ensembleData(forecasts = srftGrid[ ,labels],
##D                                latitude = srftGrid$lat,
##D                                longitude = srftGrid$lon,
##D                                forecastHour = 48,
##D                                initializationTime = "00")
##D 
##D   srftGridForc <- quantileForecast( srftFit, srftGridData, 
##D                      date = "2004013100")
## End(Not run)


