library(ensembleMOS)


### Name: brierScore
### Title: Brier Score
### Aliases: brierScore brierScore.ensembleMOScsg0
###   brierScore.ensembleMOSgev0 brierScore.fitMOScsg0
###   brierScore.fitMOSgev0
### Keywords: models

### ** Examples

data("ensBMAtest", package = "ensembleBMA")

ensMemNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")

obs <- paste("PCP24","obs", sep = ".")
ens <- paste("PCP24", ensMemNames, sep = ".")
prcpTestData <- ensembleData(forecasts = ensBMAtest[,ens],
                             dates = ensBMAtest[,"vdate"],
                             observations = ensBMAtest[,obs],
                             station = ensBMAtest[,"station"],
                             forecastHour = 48,
                             initializationTime = "00")

prcpTestFitCSG0 <- ensembleMOScsg0(prcpTestData, trainingDays = 25,
                                   dates = "2008010100")

brierScore(prcpTestFitCSG0, ensembleData = prcpTestData, 
           thresholds = 0)



