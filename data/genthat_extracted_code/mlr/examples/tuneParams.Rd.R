library(mlr)


### Name: tuneParams
### Title: Hyperparameter tuning.
### Aliases: tuneParams

### ** Examples

# a grid search for an SVM (with a tiny number of points...)
# note how easily we can optimize on a log-scale
ps = makeParamSet(
  makeNumericParam("C", lower = -12, upper = 12, trafo = function(x) 2^x),
  makeNumericParam("sigma", lower = -12, upper = 12, trafo = function(x) 2^x)
)
ctrl = makeTuneControlGrid(resolution = 2L)
rdesc = makeResampleDesc("CV", iters = 2L)
res = tuneParams("classif.ksvm", iris.task, rdesc, par.set = ps, control = ctrl)
print(res)
# access data for all evaluated points
print(head(as.data.frame(res$opt.path)))
print(head(as.data.frame(res$opt.path, trafo = TRUE)))
# access data for all evaluated points - alternative
print(head(generateHyperParsEffectData(res)))
print(head(generateHyperParsEffectData(res, trafo = TRUE)))

## Not run: 
##D # we optimize the SVM over 3 kernels simultanously
##D # note how we use dependent params (requires = ...) and iterated F-racing here
##D ps = makeParamSet(
##D   makeNumericParam("C", lower = -12, upper = 12, trafo = function(x) 2^x),
##D   makeDiscreteParam("kernel", values = c("vanilladot", "polydot", "rbfdot")),
##D   makeNumericParam("sigma", lower = -12, upper = 12, trafo = function(x) 2^x,
##D     requires = quote(kernel == "rbfdot")),
##D   makeIntegerParam("degree", lower = 2L, upper = 5L,
##D     requires = quote(kernel == "polydot"))
##D )
##D print(ps)
##D ctrl = makeTuneControlIrace(maxExperiments = 5, nbIterations = 1, minNbSurvival = 1)
##D rdesc = makeResampleDesc("Holdout")
##D res = tuneParams("classif.ksvm", iris.task, rdesc, par.set = ps, control = ctrl)
##D print(res)
##D print(head(as.data.frame(res$opt.path)))
##D 
##D # include the training set performance as well
##D rdesc = makeResampleDesc("Holdout", predict = "both")
##D res = tuneParams("classif.ksvm", iris.task, rdesc, par.set = ps,
##D   control = ctrl, measures = list(mmce, setAggregation(mmce, train.mean)))
##D print(res)
##D print(head(as.data.frame(res$opt.path)))
## End(Not run)



