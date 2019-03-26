library(h2o)


### Name: h2o.summary
### Title: Summarizes the columns of an H2OFrame.
### Aliases: h2o.summary summary.H2OFrame

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.importFile(path = prostate_path)
summary(prostate)
summary(prostate$GLEASON)
summary(prostate[,4:6])
summary(prostate, exact_quantiles=TRUE)
## End(No test)



