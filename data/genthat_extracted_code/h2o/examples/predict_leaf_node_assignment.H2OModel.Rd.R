library(h2o)


### Name: predict_leaf_node_assignment.H2OModel
### Title: Predict the Leaf Node Assignment on an H2O Model
### Aliases: predict_leaf_node_assignment.H2OModel
###   h2o.predict_leaf_node_assignment

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
prostate$CAPSULE <- as.factor(prostate$CAPSULE)
prostate_gbm <- h2o.gbm(3:9, "CAPSULE", prostate)
h2o.predict(prostate_gbm, prostate)
h2o.predict_leaf_node_assignment(prostate_gbm, prostate)
## End(No test)



