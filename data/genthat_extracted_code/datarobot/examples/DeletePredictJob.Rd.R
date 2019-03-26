library(datarobot)


### Name: DeletePredictJob
### Title: Function to delete one predict job from the DataRobot queue
### Aliases: DeletePredictJob

### ** Examples

## Not run: 
##D   projectId <- "59a5af20c80891534e3c2bde"
##D   initialJobs <- GetPredictJobs(project)
##D   job <- initialJobs[[1]]
##D   predictJobId <- job$predictJobId
##D   DeletePredictJob(projectId, predictJobId)
## End(Not run)



