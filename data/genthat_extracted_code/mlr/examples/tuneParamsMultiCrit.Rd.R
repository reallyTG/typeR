library(mlr)


### Name: tuneParamsMultiCrit
### Title: Hyperparameter tuning for multiple measures at once.
### Aliases: tuneParamsMultiCrit

### ** Examples

## No test: 
# multi-criteria optimization of (tpr, fpr) with NGSA-II
lrn =  makeLearner("classif.ksvm")
rdesc = makeResampleDesc("Holdout")
ps = makeParamSet(
  makeNumericParam("C", lower = -12, upper = 12, trafo = function(x) 2^x),
  makeNumericParam("sigma", lower = -12, upper = 12, trafo = function(x) 2^x)
)
ctrl = makeTuneMultiCritControlNSGA2(popsize = 4L, generations = 1L)
res = tuneParamsMultiCrit(lrn, sonar.task, rdesc, par.set = ps,
  measures = list(tpr, fpr), control = ctrl)
plotTuneMultiCritResult(res, path = TRUE)
## End(No test)



