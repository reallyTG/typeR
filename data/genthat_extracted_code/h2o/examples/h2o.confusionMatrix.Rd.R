library(h2o)


### Name: h2o.confusionMatrix
### Title: Access H2O Confusion Matrices
### Aliases: h2o.confusionMatrix h2o.confusionMatrix,H2OModel-method
###   h2o.confusionMatrix,H2OModelMetrics-method

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(prostate_path)
prostate[,2] <- as.factor(prostate[,2])
model <- h2o.gbm(x = 3:9, y = 2, training_frame = prostate, distribution = "bernoulli")
h2o.confusionMatrix(model, prostate)
# Generating a ModelMetrics object
perf <- h2o.performance(model, prostate)
h2o.confusionMatrix(perf)
## End(No test)



