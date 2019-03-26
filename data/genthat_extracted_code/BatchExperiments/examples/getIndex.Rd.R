library(BatchExperiments)


### Name: getIndex
### Title: Group experiments.
### Aliases: getIndex

### ** Examples

# create a registry and add problems and algorithms
reg = makeExperimentRegistry("getIndex", file.dir = tempfile(""))
addProblem(reg, "prob", static = 1)
addAlgorithm(reg, "f0", function(static, dynamic) static)
addAlgorithm(reg, "f1", function(static, dynamic, i, k) static * i^k)
ad = list(makeDesign("f0"), makeDesign("f1", exhaustive = list(i = 1:5, k = 1:3)))
addExperiments(reg, algo.designs = ad)
submitJobs(reg)

# get grouped job ids
ids = getJobIds(reg)
by(ids, getIndex(reg, by.prob = TRUE, by.algo = TRUE), identity)
ids = findExperiments(reg, algo.pattern = "f1")
by(ids, getIndex(reg, ids, by.algo.pars = (k == 1)), identity)

# groupwise reduction
ids = findExperiments(reg, algo.pattern = "f1")
showStatus(reg, ids)
f = function(aggr, job, res) aggr + res
by(ids, getIndex(reg, ids, by.algo.pars = k), reduceResults, reg = reg, fun = f)
by(ids, getIndex(reg, ids, by.algo.pars = i), reduceResults, reg = reg, fun = f)



