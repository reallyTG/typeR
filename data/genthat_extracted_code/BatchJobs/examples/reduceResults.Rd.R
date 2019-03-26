library(BatchJobs)


### Name: reduceResults
### Title: Reduce results from result directory.
### Aliases: reduceResults reduceResultsList reduceResultsVector
###   reduceResultsMatrix reduceResultsDataFrame reduceResultsDataTable

### ** Examples

# generate results:
reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)
f = function(x) x^2
batchMap(reg, f, 1:5)
submitJobs(reg)
waitForJobs(reg)

# reduce results to a vector
reduceResultsVector(reg)
# reduce results to sum
reduceResults(reg, fun = function(aggr, job, res) aggr+res)

reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)
f = function(x) list(a = x, b = as.character(2*x), c = x^2)
batchMap(reg, f, 1:5)
submitJobs(reg)
waitForJobs(reg)

# reduce results to a vector
reduceResultsVector(reg, fun = function(job, res) res$a)
reduceResultsVector(reg, fun = function(job, res) res$b)
# reduce results to a list
reduceResultsList(reg)
# reduce results to a matrix
reduceResultsMatrix(reg, fun = function(job, res) res[c(1,3)])
reduceResultsMatrix(reg, fun = function(job, res) c(foo = res$a, bar = res$c), rows = TRUE)
reduceResultsMatrix(reg, fun = function(job, res) c(foo = res$a, bar = res$c), rows = FALSE)
# reduce results to a data.frame
print(str(reduceResultsDataFrame(reg)))
# reduce results to a sum
reduceResults(reg, fun = function(aggr, job, res) aggr+res$a, init = 0)



