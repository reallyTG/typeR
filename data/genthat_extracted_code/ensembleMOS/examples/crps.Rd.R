library(ensembleMOS)


### Name: crps
### Title: Continuous Ranked Probability Score
### Aliases: crps crps.ensembleMOSnormal crps.ensembleMOStruncnormal
###   crps.ensembleMOSlognormal crps.ensembleMOScsg0 crps.ensembleMOSgev0
###   crps.fitMOSnormal crps.fitMOStruncnormal crps.fitMOSlognormal
###   crps.fitMOScsg0 crps.fitMOSgev0
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
                           dates = "2008010100",
                           model = "normal")

crpsValues <- crps(tempTestFit, tempTestData)
colMeans(crpsValues)



