library(h2o)


### Name: as.factor
### Title: Convert H2O Data to Factors
### Aliases: as.factor

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
prostate[, 2] <- as.factor(prostate[, 2])
summary(prostate)
## End(No test)



