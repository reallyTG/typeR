library(BatchJobs)


### Name: batchQuery
### Title: Manually query the BatchJobs database
### Aliases: batchQuery

### ** Examples

reg = makeRegistry("test", file.dir = tempfile())
batchMap(reg, identity, i = 1:10)
batchQuery(reg, "SELECT * FROM test_job_status")



