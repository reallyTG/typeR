library(batchtools)


### Name: getJobTable
### Title: Query Job Information
### Aliases: getJobTable getJobStatus getJobResources getJobPars getJobTags

### ** Examples

## Don't show: 
 batchtools:::example_push_temp(1) 
## End(Don't show)
tmp = makeRegistry(file.dir = NA, make.default = FALSE)
f = function(x) if (x < 0) stop("x must be > 0") else sqrt(x)
batchMap(f, x = c(-1, 0, 1), reg = tmp)
submitJobs(reg = tmp)
waitForJobs(reg = tmp)
addJobTags(1:2, "tag1", reg = tmp)
addJobTags(2, "tag2", reg = tmp)

# Complete table:
getJobTable(reg = tmp)

# Job parameters:
getJobPars(reg = tmp)

# Set and retrieve tags:
getJobTags(reg = tmp)

# Job parameters with tags right-joined:
rjoin(getJobPars(reg = tmp), getJobTags(reg = tmp))



