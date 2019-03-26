library(h2o)


### Name: h2o.median
### Title: H2O Median
### Aliases: h2o.median median.H2OFrame

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
h2o.median(prostate)
## End(No test)



