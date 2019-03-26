library(h2o)


### Name: h2o.var
### Title: Variance of a column or covariance of columns.
### Aliases: h2o.var var

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
var(prostate$AGE)
## End(No test)



