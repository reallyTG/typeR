library(ParamHelpers)


### Name: checkParamSet
### Title: Sanity check expressions of a parameter set.
### Aliases: checkParamSet

### ** Examples

ps = makeParamSet(
  makeNumericParam("u", lower = expression(p)),
  makeIntegerParam("v", lower = 1, upper = expression(3 * p)),
  makeDiscreteParam("w", default = expression(z), values = c("a", "b")),
  makeDiscreteParam("x", default = "a", values = c("a", "b")),
  keys = c("p", "z")
)
checkParamSet(ps, dict = list(p = 3, z = "b"))



