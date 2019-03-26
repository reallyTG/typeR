library(BatchJobs)


### Name: batchMap
### Title: Maps a function over lists or vectors, adding jobs to a
###   registry.
### Aliases: batchMap

### ** Examples

reg = makeRegistry(id = "BatchJobsExample", file.dir = tempfile(), seed = 123)
f = function(x) x^2
batchMap(reg, f, 1:10)
print(reg)



