library(h2o)


### Name: h2o.acos
### Title: Compute the arc cosine of x
### Aliases: h2o.acos

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
h2o.acos(prostate[,2])
## End(No test)



