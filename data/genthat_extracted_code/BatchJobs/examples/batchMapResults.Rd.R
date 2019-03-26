library(BatchJobs)


### Name: batchMapResults
### Title: Maps a function over the results of a registry by using
###   batchMap.
### Aliases: batchMapResults

### ** Examples

reg1 = makeRegistry(id = "BatchJobsExample1", file.dir = tempfile(), seed = 123)
# square some numbers
f = function(x) x^2
batchMap(reg1, f, 1:10)

# submit jobs and wait for the jobs to finish
submitJobs(reg1)
waitForJobs(reg1)

# look at results
reduceResults(reg1, fun = function(aggr,job,res) c(aggr, res))

reg2 = makeRegistry(id = "BatchJobsExample2", file.dir = tempfile(), seed = 123)

# define function to tranform results, we simply do the inverse of the squaring
g = function(job, res) sqrt(res)
batchMapResults(reg1, reg2, fun = g)

# submit jobs and wait for the jobs to finish
submitJobs(reg2)
waitForJobs(reg2)

# check results
reduceResults(reg2, fun = function(aggr,job,res) c(aggr, res))



