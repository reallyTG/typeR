library(ParamHelpers)


### Name: getParamIds
### Title: Return ids of parameters in parameter set.
### Aliases: getParamIds

### ** Examples

ps = makeParamSet(
  makeNumericParam("u"),
  makeIntegerVectorParam("v", len = 2)
)
getParamIds(ps)
getParamIds(ps, repeated = TRUE)
getParamIds(ps, repeated = TRUE, with.nr = TRUE)



