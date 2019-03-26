library(h2o)


### Name: h2o.clearLog
### Title: Delete All H2O R Logs
### Aliases: h2o.clearLog

### ** Examples

## No test: 
library(h2o)
h2o.init()
h2o.startLogging()
australia_path = system.file("extdata", "australia.csv", package = "h2o")
australia = h2o.importFile(path = australia_path)
h2o.stopLogging()
h2o.clearLog()
## End(No test)



