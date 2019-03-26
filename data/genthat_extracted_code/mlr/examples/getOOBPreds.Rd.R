library(mlr)


### Name: getOOBPreds
### Title: Extracts out-of-bag predictions from trained models.
### Aliases: getOOBPreds

### ** Examples

training.set = sample(1:150, 50)
lrn = makeLearner("classif.ranger", predict.type = "prob", predict.threshold = 0.6)
mod = train(lrn, sonar.task, subset = training.set)
oob = getOOBPreds(mod, sonar.task)
oob
performance(oob, measures = list(auc, mmce))



