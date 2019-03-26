library(ParamHelpers)


### Name: getParamLengths
### Title: Return lengths of single parameters or parameters in parameter
###   set.
### Aliases: getParamLengths

### ** Examples

ps = makeParamSet(
  makeNumericParam("u"),
  makeIntegerParam("v", lower = 1, upper = 2),
  makeDiscreteParam("w", values = 1:2),
  makeDiscreteVectorParam("x", len = 2, values = c("a", "b"))
)
getParamLengths(ps)
# the length of the vector x is 2, for all other single value parameters the length is 1.

par = makeNumericVectorParam("x", len = expression(k), lower = 0)
getParamLengths(par, dict = list(k = 4))



