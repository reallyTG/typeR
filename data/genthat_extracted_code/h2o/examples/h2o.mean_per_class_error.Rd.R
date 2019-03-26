library(h2o)


### Name: h2o.mean_per_class_error
### Title: Retrieve the mean per class error
### Aliases: h2o.mean_per_class_error

### ** Examples

## No test: 
library(h2o)
h2o.init()

prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(prostate_path)

prostate[,2] <- as.factor(prostate[,2])
model <- h2o.gbm(x = 3:9, y = 2, training_frame = prostate, distribution = "bernoulli")
perf <- h2o.performance(model, prostate)
h2o.mean_per_class_error(perf)
h2o.mean_per_class_error(model, train=TRUE)
## End(No test)



