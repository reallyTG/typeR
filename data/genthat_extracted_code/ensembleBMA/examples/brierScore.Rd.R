library(ensembleBMA)


### Name: brierScore
### Title: Brier Scores
### Aliases: brierScore brierScore.ensembleBMAgamma
###   brierScore.ensembleBMAgamma0 brierScore.ensembleBMAnormal
###   brierScore.fitBMAgamma brierScore.fitBMAgamma0
###   brierScore.fitBMAnormal
### Keywords: models

### ** Examples

  data(ensBMAtest)

  ensMemNames <- c("gfs","cmcg","eta","gasp","jma","ngps","tcwb","ukmo")
  
  obs <- paste("PCP24","obs", sep = ".")
  ens <- paste("PCP24", ensMemNames, sep = ".")

  prcpTestData <- ensembleData( forecasts = ensBMAtest[,ens],
                                dates = ensBMAtest[,"vdate"], 
                                observations = ensBMAtest[,obs], 
                                station = ensBMAtest[,"station"],
                                forecastHour = 48,
                                initializationTime = "00")

## Not run: 
##D  # R check
##D   prcpTestFit <- ensembleBMAgamma0( prcpTestData, trainingDays = 30)
## End(Not run) 

  hist(prcpTestData$obs)

  brierScore(prcpTestFit, prcpTestData,
             thresholds = seq(from = 0, to = .5, by = .1))




