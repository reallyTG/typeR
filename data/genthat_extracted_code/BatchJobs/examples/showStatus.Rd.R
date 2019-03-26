library(BatchJobs)


### Name: showStatus
### Title: Retrieve or show status information about jobs.
### Aliases: showStatus getStatus

### ** Examples

reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)
f = function(x) x^2
batchMap(reg, f, 1:10)
submitJobs(reg)
waitForJobs(reg)

# should show 10 submitted jobs, which are all done.
showStatus(reg)



