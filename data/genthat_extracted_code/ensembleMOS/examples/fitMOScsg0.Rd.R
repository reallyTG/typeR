library(ensembleMOS)


### Name: fitMOScsg0
### Title: Censored and shifted gamma EMOS modeling
### Aliases: fitMOScsg0
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

prcpTestFit <- fitMOScsg0(prcpTrain)



