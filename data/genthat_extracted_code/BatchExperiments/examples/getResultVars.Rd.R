library(BatchExperiments)


### Name: getResultVars
### Title: Get variable groups of reduced results.
### Aliases: getResultVars

### ** Examples

reg = makeExperimentRegistry("BatchExample", seed = 123, file.dir = tempfile())
addProblem(reg, "p1", static = 1)
addProblem(reg, "p2", static = 2)
addAlgorithm(reg, id = "a1",
  fun = function(static, dynamic, alpha) c(y = static*alpha))
addAlgorithm(reg, id = "a2",
  fun = function(static, dynamic, alpha, beta) c(y = static*alpha+beta))
ad1 = makeDesign("a1", exhaustive = list(alpha = 1:2))
ad2 = makeDesign("a2", exhaustive = list(alpha = 1:2, beta = 5:6))
addExperiments(reg, algo.designs = list(ad1, ad2), repls = 2)
submitJobs(reg)
data = reduceResultsExperiments(reg)
library(plyr)
ddply(data, getResultVars(data, "group"), summarise, mean_y = mean(y))



