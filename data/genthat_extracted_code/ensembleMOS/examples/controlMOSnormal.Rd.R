library(ensembleMOS)


### Name: controlMOSnormal
### Title: Control parameters for Gaussian (normal) EMOS models
### Aliases: controlMOSnormal
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

tempTestFit <- ensembleMOSnormal(tempTestData, trainingDays = 25, 
                                 dates = "2008010100",
                                 control = controlMOSnormal(maxIter = as.integer(100),
                                                            scoringRule = "log",
                                                            optimRule = "BFGS",
                                                            coefRule= "none", 
                                                            varRule = "square"))



