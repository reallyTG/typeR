library(BatchJobs)


### Name: findJobs
### Title: Finds ids of jobs that match a query.
### Aliases: findJobs

### ** Examples

reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)
f = function(x, y) x * y
batchExpandGrid(reg, f, x = 1:2, y = 1:3)
findJobs(reg, pars = (y > 2))



