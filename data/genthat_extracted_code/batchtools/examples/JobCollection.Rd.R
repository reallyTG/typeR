library(batchtools)


### Name: makeJobCollection
### Title: JobCollection Constructor
### Aliases: makeJobCollection JobCollection

### ** Examples

## Don't show: 
 batchtools:::example_push_temp(1) 
## End(Don't show)
tmp = makeRegistry(file.dir = NA, make.default = FALSE, packages = "methods")
batchMap(identity, 1:5, reg = tmp)

# resources are usually set in submitJobs()
jc = makeJobCollection(1:3, resources = list(foo = "bar"), reg = tmp)
ls(jc)
jc$resources



