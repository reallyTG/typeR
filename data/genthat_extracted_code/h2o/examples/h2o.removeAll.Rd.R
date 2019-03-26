library(h2o)


### Name: h2o.removeAll
### Title: Remove All Objects on the H2O Cluster
### Aliases: h2o.removeAll

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
h2o.ls()
h2o.removeAll()
h2o.ls()
## End(No test)



