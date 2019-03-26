library(datarobot)


### Name: DownloadReasonCodes
### Title: Function to download and save reason codes rows as csv file
### Aliases: DownloadReasonCodes

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
##D   file <- file.path(tempdir(), "testReasonCode.csv")
##D   DownloadReasonCodes(projectId, reasonCodeId, file)
## End(Not run)



