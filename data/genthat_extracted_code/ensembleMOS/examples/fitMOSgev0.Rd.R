library(ensembleMOS)


### Name: fitMOSgev0
### Title: Censored generalized extreme value distribution EMOS modeling
### Aliases: fitMOSgev0
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

prcpTrain <- trainingData(prcpTestData, trainingDays = 30,
                             date = "2008010100")

prcpTestFit <- fitMOSgev0(prcpTrain)



