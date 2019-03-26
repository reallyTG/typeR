library(mlr)


### Name: resample
### Title: Fit models according to a resampling strategy.
### Aliases: resample crossval repcv holdout subsample bootstrapOOB
###   bootstrapB632 bootstrapB632plus growingcv fixedcv

### ** Examples

task = makeClassifTask(data = iris, target = "Species")
rdesc = makeResampleDesc("CV", iters = 2)
r = resample(makeLearner("classif.qda"), task, rdesc)
print(r$aggr)
print(r$measures.test)
print(r$pred)

# include the training set performance as well
rdesc = makeResampleDesc("CV", iters = 2, predict = "both")
r = resample(makeLearner("classif.qda"), task, rdesc,
  measures = list(mmce, setAggregation(mmce, train.mean)))
print(r$aggr)



