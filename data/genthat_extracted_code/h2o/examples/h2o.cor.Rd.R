library(h2o)


### Name: h2o.cor
### Title: Correlation of columns.
### Aliases: h2o.cor cor

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
cor(prostate$AGE)
## End(No test)



