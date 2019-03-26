library(h2o)


### Name: h2o.openLog
### Title: View H2O R Logs
### Aliases: h2o.openLog

### ** Examples

## Not run: 
##D h2o.init()
##D 
##D h2o.startLogging()
##D australia_path = system.file("extdata", "australia.csv", package = "h2o")
##D australia = h2o.importFile(path = australia_path)
##D h2o.stopLogging()
##D 
##D # Not run to avoid windows being opened during R CMD check
##D # h2o.openLog("Command")
##D # h2o.openLog("Error")
## End(Not run)



