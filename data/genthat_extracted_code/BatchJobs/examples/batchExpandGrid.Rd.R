library(BatchJobs)


### Name: batchExpandGrid
### Title: Map function over all combinations.
### Aliases: batchExpandGrid

### ** Examples

reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)
f = function(x, y, z) x * y  + z
# lets store the param grid
grid = batchExpandGrid(reg, f, x = 1:2, y = 1:3, more.args = list(z = 10))
submitJobs(reg)
waitForJobs(reg)
y = reduceResultsVector(reg)
# later, we can always access the param grid like this
grid = getJobParamDf(reg)
cbind(grid, y = y)



