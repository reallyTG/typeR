library(ParamHelpers)


### Name: getDefaults
### Title: Return defaults of parameters in parameter set.
### Aliases: getDefaults

### ** Examples

ps1 = makeParamSet(
  makeDiscreteParam("x", values = c("a", "b"), default = "a"),
  makeNumericVectorParam("y", len = 2),
  makeIntegerParam("z", default = 99)
)
getDefaults(ps1, include.null = TRUE)

ps2 = makeParamSet(
  makeNumericVectorParam("a", len = expression(k), default = expression(p)),
  makeIntegerParam("b", default = 99),
  makeLogicalParam("c")
)
getDefaults(ps2, dict = list(k = 3, p = 5.4))



