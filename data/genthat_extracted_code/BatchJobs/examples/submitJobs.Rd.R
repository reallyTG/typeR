library(BatchJobs)


### Name: submitJobs
### Title: Submit jobs or chunks of jobs to batch system via cluster
###   function.
### Aliases: submitJobs

### ** Examples

reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)
f = function(x) x^2
batchMap(reg, f, 1:10)
submitJobs(reg)
waitForJobs(reg)

# Submit the 10 jobs again, now randomized into 2 chunks:
chunked = chunk(getJobIds(reg), n.chunks = 2, shuffle = TRUE)
submitJobs(reg, chunked)



