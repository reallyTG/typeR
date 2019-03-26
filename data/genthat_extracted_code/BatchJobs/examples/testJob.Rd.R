library(BatchJobs)


### Name: testJob
### Title: Tests a job by running it with Rscript in a new process.
### Aliases: testJob

### ** Examples

reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)
f = function(x) if (x==1) stop("oops") else x
batchMap(reg, f, 1:2)
testJob(reg, 2)



