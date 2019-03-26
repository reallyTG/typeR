library(h2o)


### Name: h2o.metric
### Title: H2O Model Metric Accessor Functions
### Aliases: h2o.metric h2o.F0point5 h2o.F1 h2o.F2 h2o.accuracy h2o.error
###   h2o.maxPerClassError h2o.mean_per_class_accuracy h2o.mcc
###   h2o.precision h2o.tpr h2o.fpr h2o.fnr h2o.tnr h2o.recall
###   h2o.sensitivity h2o.fallout h2o.missrate h2o.specificity

### ** Examples

## No test: 
library(h2o)
h2o.init()

prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(prostate_path)

prostate$CAPSULE <- as.factor(prostate$CAPSULE)
model <- h2o.gbm(x = 3:9, y = 2, training_frame = prostate, distribution = "bernoulli")
perf <- h2o.performance(model, prostate)
h2o.F1(perf)
## End(No test)



