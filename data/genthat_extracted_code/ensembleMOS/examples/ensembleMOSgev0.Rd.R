library(ensembleMOS)


### Name: ensembleMOSgev0
### Title: Censored generalized extreme value distribution EMOS modeling
### Aliases: ensembleMOSgev0
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
                             
prcpTestFitGEV0 <- ensembleMOSgev0(prcpTestData, trainingDays = 25,
                                   dates = "2008010100")



