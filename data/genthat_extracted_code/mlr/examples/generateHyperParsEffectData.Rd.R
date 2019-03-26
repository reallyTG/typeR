library(mlr)


### Name: generateHyperParsEffectData
### Title: Generate hyperparameter effect data.
### Aliases: generateHyperParsEffectData

### ** Examples

## Not run: 
##D # 3-fold cross validation
##D ps = makeParamSet(makeDiscreteParam("C", values = 2^(-4:4)))
##D ctrl = makeTuneControlGrid()
##D rdesc = makeResampleDesc("CV", iters = 3L)
##D res = tuneParams("classif.ksvm", task = pid.task, resampling = rdesc,
##D par.set = ps, control = ctrl)
##D data = generateHyperParsEffectData(res)
##D plt = plotHyperParsEffect(data, x = "C", y = "mmce.test.mean")
##D plt + ylab("Misclassification Error")
##D 
##D # nested cross validation
##D ps = makeParamSet(makeDiscreteParam("C", values = 2^(-4:4)))
##D ctrl = makeTuneControlGrid()
##D rdesc = makeResampleDesc("CV", iters = 3L)
##D lrn = makeTuneWrapper("classif.ksvm", control = ctrl,
##D                       resampling = rdesc, par.set = ps)
##D res = resample(lrn, task = pid.task, resampling = cv2,
##D                extract = getTuneResult)
##D data = generateHyperParsEffectData(res)
##D plotHyperParsEffect(data, x = "C", y = "mmce.test.mean", plot.type = "line")
## End(Not run)



