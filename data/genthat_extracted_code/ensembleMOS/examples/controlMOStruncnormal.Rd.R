library(ensembleMOS)


### Name: controlMOStruncnormal
### Title: Control parameters for truncated normal EMOS models
### Aliases: controlMOStruncnormal
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

windTestFitTN <- ensembleMOStruncnormal(windTestData, trainingDays = 25,
                                        dates = "2008010100",
                                        control = controlMOStruncnormal(maxIter = as.integer(100),
                                                                        scoringRule = "log",
                                                                        optimRule = "BFGS",
                                                                        coefRule= "none", 
                                                                        varRule = "square"))



