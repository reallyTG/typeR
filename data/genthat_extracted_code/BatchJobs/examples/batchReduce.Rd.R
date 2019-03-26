library(BatchJobs)


### Name: batchReduce
### Title: Reduces via a binary function over a list adding jobs to a
###   registry.
### Aliases: batchReduce

### ** Examples

# define function to reduce on slave, we want to sum a vector
f = function(aggr, x) aggr + x
reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)

# sum 20 numbers on each slave process, i.e. 5 jobs
batchReduce(reg, fun = f, 1:100, init = 0, block.size = 5)
submitJobs(reg)
waitForJobs(reg)

# now reduce one final time on master
reduceResults(reg, fun = function(aggr,job,res) f(aggr, res))



