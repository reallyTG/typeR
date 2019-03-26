library(batchtools)


### Name: testJob
### Title: Run Jobs Interactively
### Aliases: testJob

### ** Examples

## Don't show: 
 batchtools:::example_push_temp(1) 
## End(Don't show)
tmp = makeRegistry(file.dir = NA, make.default = FALSE)
batchMap(function(x) if (x == 2) xxx else x, 1:2, reg = tmp)
testJob(1, reg = tmp)
## Not run: 
##D testJob(2, reg = tmp)
## End(Not run)



