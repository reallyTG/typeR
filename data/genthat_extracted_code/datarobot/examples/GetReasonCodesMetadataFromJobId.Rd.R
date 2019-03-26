library(datarobot)


### Name: GetReasonCodesMetadataFromJobId
### Title: Retrieve the reason codes metadata for a model using jobId
### Aliases: GetReasonCodesMetadataFromJobId

### ** Examples

## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   modelId <- "5996f820af07fc605e81ead4"
##D   datasets <- ListPredictionDatasets(projectId)
##D   dataset <- datasets[[1]]
##D   datasetId <- dataset$id
##D   model <- GetModel(model, datasetId)
##D   jobId <- RequestReasonCodes(model, datasetId)
##D   GetReasonCodesMetadataFromJobId(projectId, jobId)
## End(Not run)



