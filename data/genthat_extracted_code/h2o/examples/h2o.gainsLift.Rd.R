library(h2o)


### Name: h2o.gainsLift
### Title: Access H2O Gains/Lift Tables
### Aliases: h2o.gainsLift h2o.gainsLift,H2OModel-method
###   h2o.gainsLift,H2OModelMetrics-method

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(prostate_path)
prostate[,2] <- as.factor(prostate[,2])
model <- h2o.gbm(x = 3:9, y = 2, distribution = "bernoulli",
                 training_frame = prostate, validation_frame = prostate, nfolds=3)
h2o.gainsLift(model)              ## extract training metrics
h2o.gainsLift(model, valid=TRUE)  ## extract validation metrics (here: the same)
h2o.gainsLift(model, xval =TRUE)  ## extract cross-validation metrics
h2o.gainsLift(model, newdata=prostate) ## score on new data (here: the same)
# Generating a ModelMetrics object
perf <- h2o.performance(model, prostate)
h2o.gainsLift(perf)               ## extract from existing metrics object
## End(No test)



