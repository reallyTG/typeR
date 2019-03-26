library(BatchExperiments)


### Name: findExperiments
### Title: Find ids of experiments that match a query.
### Aliases: findExperiments

### ** Examples

reg = makeExperimentRegistry(id = "example1", file.dir = tempfile())
p1 = addProblem(reg, "one", 1)
p2 = addProblem(reg, "two", 2)
a = addAlgorithm(reg, "A", fun = function(static, n) static + n)
addExperiments(reg, algo.design = makeDesign(a, exhaustive = list(n = 1:4)))
findExperiments(reg, prob.pattern = "one")
findExperiments(reg, prob.pattern = "o")
findExperiments(reg, algo.pars = (n > 2))



