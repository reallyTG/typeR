library(ParamHelpers)


### Name: getParamNr
### Title: Return number of parameters in set.
### Aliases: getParamNr

### ** Examples

ps = makeParamSet(
  makeNumericParam("u"),
  makeDiscreteVectorParam("x", len = 2, values = c("a", "b"))
)
getParamNr(ps)
getParamNr(ps, devectorize = TRUE)



