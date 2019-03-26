library(batchtools)


### Name: JobNames
### Title: Set and Retrieve Job Names
### Aliases: JobNames setJobNames getJobNames

### ** Examples

## Don't show: 
 batchtools:::example_push_temp(1) 
## End(Don't show)
tmp = makeRegistry(file.dir = NA, make.default = FALSE)
ids = batchMap(identity, 1:10, reg = tmp)
setJobNames(ids, letters[1:nrow(ids)], reg = tmp)
getJobNames(reg = tmp)



