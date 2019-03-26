library(batchtools)


### Name: showLog
### Title: Inspect Log Files
### Aliases: showLog getLog

### ** Examples

## Don't show: 
 batchtools:::example_push_temp(1) 
## End(Don't show)
tmp = makeRegistry(file.dir = NA, make.default = FALSE)

# Create some dummy jobs
fun = function(i) {
  if (i == 3) stop(i)
  if (i %% 2 == 1) warning("That's odd.")
}
ids = batchMap(fun, i = 1:5, reg = tmp)
submitJobs(reg = tmp)
waitForJobs(reg = tmp)
getStatus(reg = tmp)

writeLines(getLog(ids[1], reg = tmp))
## Not run: 
##D showLog(ids[1], reg = tmp)
## End(Not run)

grepLogs(pattern = "warning", ignore.case = TRUE, reg = tmp)



