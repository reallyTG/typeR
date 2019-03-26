library(h2o)


### Name: as.data.frame.H2OFrame
### Title: Converts parsed H2O data into an R data frame
### Aliases: as.data.frame.H2OFrame

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
as.data.frame(prostate)
## End(No test)



