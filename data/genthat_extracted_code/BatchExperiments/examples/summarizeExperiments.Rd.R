library(BatchExperiments)


### Name: summarizeExperiments
### Title: Summarize selected experiments.
### Aliases: summarizeExperiments

### ** Examples

reg = makeExperimentRegistry("summarizeExperiments", seed = 123, file.dir = tempfile())
p1 = addProblem(reg, "p1", static = 1)
a1 = addAlgorithm(reg, id = "a1", fun = function(static, dynamic, alpha, beta) 1)
a2 = addAlgorithm(reg, id = "a2", fun = function(static, dynamic, alpha, gamma) 2)
ad1 = makeDesign(a1, exhaustive = list(alpha = 1:2, beta = 1:2))
ad2 = makeDesign(a2, exhaustive = list(alpha = 1:2, gamma = 7:8))
addExperiments(reg, algo.designs = list(ad1, ad2), repls = 2)
print(summarizeExperiments(reg))
print(summarizeExperiments(reg, show = c("prob", "algo", "alpha", "gamma")))



