library(h2o)


### Name: h2o.stopLogging
### Title: Stop Writing H2O R Logs
### Aliases: h2o.stopLogging

### ** Examples

## No test: 
library(h2o)
h2o.init()
h2o.startLogging()
australia_path = system.file("extdata", "australia.csv", package = "h2o")
australia = h2o.importFile(path = australia_path)
h2o.stopLogging()
## End(No test)



