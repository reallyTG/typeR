library(datarobot)


### Name: RequestTransferrableModel
### Title: Request generation of an transferrable model file for use in an
###   on-premise DataRobot standalone prediction environment. This function
###   can only be used if model export is enabled, and will only be useful
###   if you have an on-premise environment in which to import it. This
###   function does not download the exported file. Use
###   DownloadTransferrableModel for that.
### Aliases: RequestTransferrableModel

### ** Examples

## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   modelId <- "5996f820af07fc605e81ead4"
##D   jobId <- RequestTransferrrableModel(projectId, modelId)
##D   WaitForJobToComplete(projectId, jobId)
##D   file <- file.path(tempdir(), "model.drmodel")
##D   DownloadTransferrableModel(projectObject, modelId, file)
## End(Not run)



