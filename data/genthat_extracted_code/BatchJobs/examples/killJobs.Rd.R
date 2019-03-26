library(BatchJobs)


### Name: killJobs
### Title: Kill some jobs on the batch system.
### Aliases: killJobs

### ** Examples

## Not run: 
##D reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)
##D f = function(x) Sys.sleep(x)
##D batchMap(reg, f, 1:10 + 5)
##D submitJobs(reg)
##D waitForJobs(reg)
##D 
##D # kill all jobs currently _running_
##D killJobs(reg, findRunning(reg))
##D # kill all jobs queued or running
##D killJobs(reg, findNotTerminated(reg))
## End(Not run)



