library(datarobot)


### Name: DownloadTrainingPredictions
### Title: Download training predictions on a specified data set.
### Aliases: DownloadTrainingPredictions

### ** Examples

## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   predictions <- ListTrainingPredictions(projectId)
##D   predictionId <- predictions[[1]]$predictionId
##D   file <- file.path(tempdir(), "myTrainingPredictions.csv")
##D   DownloadTrainingPredictions(proejctId, predictionId, file)
## End(Not run)



