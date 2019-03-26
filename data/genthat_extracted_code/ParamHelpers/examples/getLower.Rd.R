library(ParamHelpers)


### Name: getLower
### Title: Get lower / upper bounds and allowed discrete values for
###   parameters.
### Aliases: getLower getUpper getValues

### ** Examples

ps = makeParamSet(
  makeNumericParam("u"),
  makeDiscreteParam("v", values = c("a", "b")),
  makeIntegerParam("w", lower = expression(ceiling(p / 3)), upper = 2),
  makeDiscreteParam("x", values = 1:2),
  makeNumericVectorParam("y", len = 2, lower = c(0, 10), upper = c(1, 11)),
  keys = "p"
)
getLower(ps, dict = list(p = 7))
getUpper(ps)

ps = makeParamSet(
  makeNumericParam("u"),
  makeDiscreteParam("w", values = list(a = list(), b = NULL))
)
getValues(ps)

par.vals = list(
  u = makeNumericParam("u"),
  v = makeIntegerParam("v", lower = 1, upper = 2),
  w = makeDiscreteParam("w", values = 1:2),
  x = makeNumericVectorParam("x", len = 2, lower = c(3, 1), upper = expression(n))
)
getLower(par.vals)
getUpper(par.vals, dict = list(n = 12))



