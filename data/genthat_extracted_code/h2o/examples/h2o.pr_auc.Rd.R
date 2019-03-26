library(h2o)


### Name: h2o.pr_auc
### Title: Retrieve the pr_auc
### Aliases: h2o.pr_auc

### ** Examples

## No test: 
library(h2o)
h2o.init()

prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(prostate_path)

prostate[,2] <- as.factor(prostate[,2])
model <- h2o.gbm(x = 3:9, y = 2, training_frame = prostate, distribution = "bernoulli")
perf <- h2o.performance(model, prostate)
h2o.pr_auc(perf)
## End(No test)



