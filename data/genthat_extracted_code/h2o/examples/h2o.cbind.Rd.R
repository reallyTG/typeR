library(h2o)


### Name: h2o.cbind
### Title: Combine H2O Datasets by Columns
### Aliases: h2o.cbind

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
prostate_cbind <- h2o.cbind(prostate, prostate)
head(prostate_cbind)
## End(No test)



