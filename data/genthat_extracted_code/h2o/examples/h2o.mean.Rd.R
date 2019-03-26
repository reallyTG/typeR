library(h2o)


### Name: h2o.mean
### Title: Compute the frame's mean by-column (or by-row).
### Aliases: h2o.mean mean.H2OFrame

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
# Default behavior. Will return list of means per column.
h2o.mean(prostate$AGE)
# return_frame set to TRUE. This will return an H2O Frame
# with mean per row or column (depends on axis argument)
h2o.mean(prostate, na.rm=TRUE, axis=1, return_frame=TRUE)
## End(No test)



