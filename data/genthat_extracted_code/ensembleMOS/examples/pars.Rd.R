library(ensembleMOS)


### Name: pars
### Title: Forecast distribution parameters
### Aliases: pars pars.ensembleMOSnormal pars.ensembleMOStruncnormal
###   pars.ensembleMOSlognormal pars.ensembleMOScsg0 pars.ensembleMOSgev0
###   pars.fitMOSnormal pars.fitMOStruncnormal pars.fitMOSlognormal
###   pars.fitMOScsg0 pars.fitMOSgev0
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

parValues <- pars(tempTestFit, tempTestData)
parValues



