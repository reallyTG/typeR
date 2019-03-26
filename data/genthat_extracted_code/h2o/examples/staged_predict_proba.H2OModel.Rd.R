library(h2o)


### Name: staged_predict_proba.H2OModel
### Title: Predict class probabilities at each stage of an H2O Model
### Aliases: staged_predict_proba.H2OModel h2o.staged_predict_proba

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
prostate$CAPSULE <- as.factor(prostate$CAPSULE)
prostate_gbm <- h2o.gbm(3:9, "CAPSULE", prostate)
h2o.predict(prostate_gbm, prostate)
h2o.staged_predict_proba(prostate_gbm, prostate)
## End(No test)



