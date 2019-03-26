## ----setup, include = FALSE, cache = FALSE-------------------------------
library(randomsearch)
set.seed(123)
knitr::opts_chunk$set(cache = TRUE, collapse = FALSE)

## ----usage---------------------------------------------------------------
obj.fun = makeSingleObjectiveFunction(
  fn = function(x) x[1]^2 + sin(x[2]),
  par.set = makeNumericParamSet(len = 2, lower = -1, upper = 2),
  minimize = TRUE
)
res = randomsearch(obj.fun, max.evals = 30)
rs = summary(res)
rs$best.x
rs$best.y

tail(as.data.frame(res))

## ----parallel_usage, eval = FALSE----------------------------------------
#  obj.fun = makeSingleObjectiveFunction(
#    fn = function(x) {
#      Sys.sleep(runif(1))
#      x[1]^2 + sin(x[2])
#    },
#    par.set = makeNumericParamSet(len = 2, lower = -1, upper = 2),
#    minimize = TRUE
#  )
#  parallelMap::parallelStartMulticore(cpus = 2, level = "randomsearch.feval")
#  res = randomsearch(obj.fun, max.execbudget = 2, max.evals = 1000)
#  summary(res)

## ----multi_objective, eval = TRUE----------------------------------------
obj.fun = makeMultiObjectiveFunction(
  fn = function(x) c(x[1]^2 + sin(x[2]), cos(x[1])),
  par.set = makeNumericParamSet(len = 2, lower = -1, upper = 2),
  minimize = c(TRUE, TRUE)
)
res = randomsearch(obj.fun, max.evals = 30)
summary(res)

