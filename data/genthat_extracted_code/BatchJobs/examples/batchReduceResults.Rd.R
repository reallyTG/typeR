library(BatchJobs)


### Name: batchReduceResults
### Title: Reduces results via a binary function and adds jobs for this to
###   a registry.
### Aliases: batchReduceResults

### ** Examples

# generating example results:
reg1 = makeRegistry(id = "BatchJobsExample1", file.dir = tempfile(), seed = 123)
f = function(x) x^2
batchMap(reg1, f, 1:20)
submitJobs(reg1)
waitForJobs(reg1)

# define function to reduce on slave, we want to sum the squares
myreduce = function(aggr, job, res) aggr + res

# sum 5 results on each slave process, i.e. 4 jobs
reg2 = makeRegistry(id = "BatchJobsExample2", file.dir = tempfile(), seed = 123)
batchReduceResults(reg1, reg2, fun = myreduce, init = 0, block.size = 5)
submitJobs(reg2)
waitForJobs(reg2)

# now reduce one final time on master
reduceResults(reg2, fun = myreduce)



