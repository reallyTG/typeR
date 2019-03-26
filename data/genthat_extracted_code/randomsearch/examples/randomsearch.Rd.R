library(randomsearch)


### Name: randomsearch
### Title: Optimizes a function with random search.
### Aliases: randomsearch

### ** Examples

obj.fun = makeSingleObjectiveFunction(
 fn = function(x) x[1]^2 + sin(x[2]),
 par.set = makeNumericParamSet(id = "x", lower = -1, upper = 1, len = 2)
)
res = randomsearch(obj.fun, max.evals = 10)
summary(res)



