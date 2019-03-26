library(h2o)


### Name: h2o.make_metrics
### Title: Create Model Metrics from predicted and actual values in H2O
### Aliases: h2o.make_metrics

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
prostate$CAPSULE <- as.factor(prostate$CAPSULE)
prostate_gbm <- h2o.gbm(3:9, "CAPSULE", prostate)
pred <- h2o.predict(prostate_gbm, prostate)[,3] ## class-1 probability
h2o.make_metrics(pred, prostate$CAPSULE)
## End(No test)



