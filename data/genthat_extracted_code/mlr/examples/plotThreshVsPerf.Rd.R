library(mlr)


### Name: plotThreshVsPerf
### Title: Plot threshold vs. performance(s) for 2-class classification
###   using ggplot2.
### Aliases: plotThreshVsPerf

### ** Examples

lrn = makeLearner("classif.rpart", predict.type = "prob")
mod = train(lrn, sonar.task)
pred = predict(mod, sonar.task)
pvs = generateThreshVsPerfData(pred, list(acc, setAggregation(acc, train.mean)))
plotThreshVsPerf(pvs)



