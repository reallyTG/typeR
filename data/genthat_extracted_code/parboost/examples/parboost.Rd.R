library(parboost)


### Name: parboost
### Title: Distributed gradient boosting based on the 'mboost' package.
### Aliases: parboost parboost-package

### ** Examples

## Run parboost on a cluster (example not run)
# data(friedman2)
# library(parallel)
# cl <- makeCluster(2)
# parboost_model <- parboost(cluster_object = cl, data = friedman2,
#                            nsplits = 2, formula = y ~ .,
#                            baselearner="bbs", postprocessing = "glm",
#                            control = boost_control(mstop=10))
# stopCluster(cl)
# print(parboost_model)
# summary(parboost_model)
# head(predict(parboost_model))
#
# ## Run parboost serially for testing/debugging purposes
# parboost_model <- parboost(data = friedman2, nsplits = 2, formula
# = y ~ ., baselearner="bbs", postprocessing = "glm", control =
# boost_control(mstop=10))



