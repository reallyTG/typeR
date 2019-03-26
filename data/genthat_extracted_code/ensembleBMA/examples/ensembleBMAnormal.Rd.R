library(ensembleBMA)


### Name: ensembleBMAnormal
### Title: BMA mixture of normals modeling
### Aliases: ensembleBMAnormal [.ensembleBMAnormal crpsNormal
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
##D  #  R check
##D   tempTestFit <- ensembleBMAnormal( tempTestData, trainingDays = 30)
##D 
##D ## equivalent to
##D ##   tempTestFit <- ensembleBMA( tempTestData, trainingDays = 30,
##D ##                                model = "normal")
## End(Not run)

# for quick run only; use more training days for forecasting
 tempTestFit <- ensembleBMAnormal( tempTestData[1:20,], trainingDays = 8)




