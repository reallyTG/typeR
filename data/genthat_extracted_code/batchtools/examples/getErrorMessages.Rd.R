library(batchtools)


### Name: getErrorMessages
### Title: Retrieve Error Messages
### Aliases: getErrorMessages

### ** Examples

## Don't show: 
 batchtools:::example_push_temp(1) 
## End(Don't show)
tmp = makeRegistry(file.dir = NA, make.default = FALSE)
fun = function(i) if (i == 3) stop(i) else i
ids = batchMap(fun, i = 1:5, reg = tmp)
submitJobs(1:4, reg = tmp)
waitForJobs(1:4, reg = tmp)
getErrorMessages(ids, reg = tmp)
getErrorMessages(ids, missing.as.error = TRUE, reg = tmp)



