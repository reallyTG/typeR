library(ensembleMOS)


### Name: controlMOScsg0
### Title: Control parameters for censored and shifted gamma EMOS models
### Aliases: controlMOScsg0
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
                                   dates = "2008010100",
                                   control = controlMOScsg0(maxIter = as.integer(100),
                                                            scoringRule = "log",
                                                            optimRule = "Nelder-Mead",
                                                            coefRule= "none", 
                                                            varRule = "square"))




