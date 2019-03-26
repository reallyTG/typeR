library(datarobot)


### Name: GetReasonCodesMetadata
### Title: Retrieve metadata for specified reason codes
### Aliases: GetReasonCodesMetadata

### ** Examples

## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   modelId <- "5996f820af07fc605e81ead4"
##D   datasets <- ListPredictionDatasets(projectId)
##D   dataset <- datasets[[1]]
##D   datasetId <- dataset$id
##D   model <- GetModel(model, datasetId)
##D   jobId <- RequestReasonCodes(model, datasetId)
##D   reasonCodeId <- GetReasonCodesMetadataFromJobId(projectId, jobId)$id
##D   GetReasonCodesMetadata(projectId, reasonCodeId)
## End(Not run)



