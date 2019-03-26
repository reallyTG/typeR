library(h2o)


### Name: h2o.skewness
### Title: Skewness of a column
### Aliases: h2o.skewness skewness.H2OFrame

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
h2o.skewness(prostate$AGE)
## End(No test)



