library(ensembleBMA)


### Name: combine
### Title: Combine Compatible BMA Models
### Aliases: combine combineCORE combine.ensembleBMAgamma
###   combine.ensembleBMAgamma0 combine.ensembleBMAnormal
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
##D   tempTestFit12 <- ensembleBMAnormal( tempTestData, trainingDays = 30,
##D                    dates = c("2008010100","2008010200"))
##D 
##D   tempTestFit34 <- ensembleBMAnormal( tempTestData, trainingDays = 30,
##D                    dates = c("2008010300","2008010400"))
## End(Not run)

# for quick run only; use more training days for forecasting
  tempTestFit12 <- ensembleBMAnormal( tempTestData, trainingDays = 8,
                   dates = c("2008010100","2008010200"))

  tempTestFit34 <- ensembleBMAnormal( tempTestData, trainingDays = 8.,
                   dates = c("2008010300","2008010400"))

  tempTestFit <- combine( tempTestFit12, tempTestFit34)



