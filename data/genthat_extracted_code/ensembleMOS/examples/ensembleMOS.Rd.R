library(ensembleMOS)


### Name: ensembleMOS
### Title: EMOS modeling
### Aliases: ensembleMOS ensembleObsLabels ensembleSize ensembleNobs
###   ensembleValidDates ensembleVerifObs ensembleObsLabels.ensembleData
###   ensembleSize.ensembleData ensembleNobs.ensembleData
###   ensembleValidDates.ensembleData ensembleVerifObs.ensembleData
###   matchEnsembleMembers matchEnsembleMembers.ensembleMOSnormal
###   matchEnsembleMembers.fitMOSnormal ensembleMemberLabels
###   ensembleMemberLabels.ensembleData matchITandFH.default matchITandFH
###   getExchangeable getHH
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
                           model = "normal")

 ## Same as
 ## tempTestFit <- ensembleMOSnormal(tempTestData, trainingDays = 25)



