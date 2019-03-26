library(h2o)


### Name: h2o.rbind
### Title: Combine H2O Datasets by Rows
### Aliases: h2o.rbind

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
prostate_rbind <- h2o.rbind(prostate, prostate)
head(prostate_rbind)
dim(prostate)
dim(prostate_rbind)
## End(No test)



