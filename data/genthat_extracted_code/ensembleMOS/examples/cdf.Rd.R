library(ensembleMOS)


### Name: cdf
### Title: Cummulative distribution function for ensemble forcasting models
### Aliases: cdf cdf.ensembleMOSnormal cdf.ensembleMOStruncnormal
###   cdf.ensembleMOSlognormal cdf.ensembleMOScsg0 cdf.ensembleMOSgev0
###   cdf.fitMOSnormal cdf.fitMOStruncnormal cdf.fitMOSlognormal
###   cdf.fitMOScsg0 cdf.fitMOSgev0
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
                           model = "normal",
                           dates = "2008010100")

tempTestCDF <- cdf(tempTestFit, tempTestData,
                   values = seq(from=277, to=282, by = 1))

tempTestCDF



