library(ParamHelpers)


### Name: evaluateParamExpressions
### Title: Evaluates all expressions within a parameter.
### Aliases: evaluateParamExpressions

### ** Examples

ps = makeParamSet(
  makeNumericParam("x", lower = expression(p), upper = expression(ceiling(3 * p))),
  makeIntegerParam("y", lower = 1, upper = 2)
)
evaluateParamExpressions(ps, dict = list(p = 3))

ps = makeParamSet(
  makeNumericParam("x", default = expression(sum(data$Species == "setosa"))),
  makeIntegerParam("y", lower = 1, upper = 2),
  keys = c("data", "Species")
)
evaluateParamExpressions(ps, dict = list(data = iris))

par.vals = list(
  x = expression(k),
  y = 5
)
evaluateParamExpressions(par.vals, dict = list(k = 3))



