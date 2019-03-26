library(batchtools)


### Name: doJobCollection
### Title: Execute Jobs of a JobCollection
### Aliases: doJobCollection

### ** Examples

## Don't show: 
 batchtools:::example_push_temp(1) 
## End(Don't show)
tmp = makeRegistry(file.dir = NA, make.default = FALSE)
batchMap(identity, 1:2, reg = tmp)
jc = makeJobCollection(1:2, reg = tmp)
doJobCollection(jc)



