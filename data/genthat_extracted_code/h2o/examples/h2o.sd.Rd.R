library(h2o)


### Name: h2o.sd
### Title: Standard Deviation of a column of data.
### Aliases: h2o.sd sd

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
sd(prostate$AGE)
## End(No test)



