library(datarobot)


### Name: GetAllReasonCodesRowsAsDataFrame
### Title: Retrieve all reason codes rows and return them as a data frame
### Aliases: GetAllReasonCodesRowsAsDataFrame

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
##D   GetReasonCodesRowsAsDataFrame(projectId, reasonCodeId)
## End(Not run)



