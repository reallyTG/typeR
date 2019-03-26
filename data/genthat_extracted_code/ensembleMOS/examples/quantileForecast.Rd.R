library(ensembleMOS)


### Name: quantileForecast
### Title: Quantile forecasts at observation locations
### Aliases: quantileForecast quantileForecast.ensembleMOSnormal
###   quantileForecast.fitMOSnormal quantileForecast.ensembleMOStruncnormal
###   quantileForecast.fitMOStruncnormal
###   quantileForecast.ensembleMOSlognormal
###   quantileForecast.fitMOSlognormal quantileForecast.ensembleMOScsg0
###   quantileForecast.fitMOScsg0 quantileForecast.ensembleMOSgev0
###   quantileForecast.fitMOSgev0
### Keywords: models

### ** Examples

data("ensBMAtest", package = "ensembleBMA")

ensMemNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")

obs <- paste("T2", "obs", sep = ".")
ens <- paste("T2", ensMemNames, sep = ".")
tempTestData <- ensembleData(forecasts = ensBMAtest[,ens],
                             dates = ensBMAtest[,"vdate"],
                             observations = ensBMAtest[,obs],
                             station = ensBMAtest[,"station"],
                             forecastHour = 48,
                             initializationTime = "00")

tempTestFit <- ensembleMOS(tempTestData, trainingDays = 25, 
                           dates = c("2008010100", "2008010200"),
                           model = "normal")

tempTestForc <- quantileForecast(tempTestFit, tempTestData)



