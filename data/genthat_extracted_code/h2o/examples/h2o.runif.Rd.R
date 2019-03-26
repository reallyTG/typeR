library(h2o)


### Name: h2o.runif
### Title: Produce a Vector of Random Uniform Numbers
### Aliases: h2o.runif

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.importFile(path = prostate_path)
s <- h2o.runif(prostate)
summary(s)

prostate_train <- prostate[s <= 0.8,]
prostate_test <- prostate[s > 0.8,]
nrow(prostate_train) + nrow(prostate_test)
## End(No test)



