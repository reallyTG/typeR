library(datarobot)


### Name: RequestPredictionsForDataset
### Title: Request predictions against a previously uploaded dataset
### Aliases: RequestPredictionsForDataset

### ** Examples

## Not run: 
##D   dataset <- UploadPredictionDataset(project, diamonds_small)
##D   model <- ListModels(project)[[1]]
##D   modelId <- model$modelId
##D   predictJobId <- RequestPredictionsForDataset(project, modelId, dataset$id)
##D   predictions <- GetPredictions(project, predictJobId)
## End(Not run)



