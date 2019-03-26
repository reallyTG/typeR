library(ensembleMOS)


### Name: controlMOSlognormal
### Title: Control parameters for log-normal EMOS models
### Aliases: controlMOSlognormal
### Keywords: models

### ** Examples

data("ensBMAtest", package = "ensembleBMA")

ensMemNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")

obs <- paste("MAXWSP10","obs", sep = ".")
ens <- paste("MAXWSP10", ensMemNames, sep = ".")
windTestData <- ensembleData(forecasts = ensBMAtest[,ens],
                             dates = ensBMAtest[,"vdate"],
                             observations = ensBMAtest[,obs],
                             station = ensBMAtest[,"station"],
                             forecastHour = 48,
                             initializationTime = "00")

windTestFitLN <- ensembleMOSlognormal(windTestData, trainingDays = 25,
                                      dates = "2008010100",
                                      control = controlMOSlognormal(maxIter = as.integer(100),
                                                                    scoringRule = "log",
                                                                    optimRule = "BFGS",
                                                                    coefRule= "none", 
                                                                    varRule = "square"))



