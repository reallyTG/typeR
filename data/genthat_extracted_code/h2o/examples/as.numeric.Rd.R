library(h2o)


### Name: as.numeric
### Title: Convert H2O Data to Numeric
### Aliases: as.numeric

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
prostate[, 2] <- as.factor (prostate[, 2])
prostate[, 2] <- as.numeric(prostate[, 2])
## End(No test)



