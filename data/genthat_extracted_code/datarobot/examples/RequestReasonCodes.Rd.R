library(datarobot)


### Name: RequestReasonCodes
### Title: Request reason codes computation for a specified model and
###   dataset.
### Aliases: RequestReasonCodes

### ** Examples

## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   modelId <- "5996f820af07fc605e81ead4"
##D   datasets <- ListPredictionDatasets(projectId)
##D   dataset <- datasets[[1]]
##D   datasetId <- dataset$id
##D   model <- GetModel(model, datasetId)
##D   RequestReasonCodes(model, datasetId)
## End(Not run)



