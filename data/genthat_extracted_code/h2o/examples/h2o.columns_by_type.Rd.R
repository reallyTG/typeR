library(h2o)


### Name: h2o.columns_by_type
### Title: Obtain a list of columns that are specified by 'coltype'
### Aliases: h2o.columns_by_type

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
h2o.columns_by_type(prostate, coltype="numeric")
## End(No test)



