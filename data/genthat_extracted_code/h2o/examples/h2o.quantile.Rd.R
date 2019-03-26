library(h2o)


### Name: h2o.quantile
### Title: Quantiles of H2O Frames.
### Aliases: h2o.quantile quantile.H2OFrame

### ** Examples

## No test: 
# Request quantiles for an H2O parsed data set:
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
# Request quantiles for a subset of columns in an H2O parsed data set
quantile(prostate[,3])
for(i in 1:ncol(prostate))
   quantile(prostate[, i])
## End(No test)



