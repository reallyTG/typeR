library(h2o)


### Name: h2o.partialPlot
### Title: Partial Dependence Plots
### Aliases: h2o.partialPlot

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
prostate[, "CAPSULE"] <- as.factor(prostate[, "CAPSULE"] )
prostate[, "RACE"] <- as.factor(prostate[,"RACE"] )
prostate_gbm <- h2o.gbm(x = c("AGE","RACE"),
                        y = "CAPSULE",
                        training_frame = prostate,
                        ntrees = 10,
                        max_depth = 5,
                        learn_rate = 0.1)
h2o.partialPlot(object = prostate_gbm, data = prostate, cols = c("AGE", "RACE"))
## End(No test)



