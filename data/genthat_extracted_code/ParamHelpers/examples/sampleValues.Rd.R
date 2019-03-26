library(ParamHelpers)


### Name: sampleValues
### Title: Sample n random values from a parameter or a parameter set
###   uniformly.
### Aliases: sampleValues

### ** Examples

p = makeIntegerParam("x", lower = -10, upper = 10)
sampleValues(p, 4)

p = makeNumericParam("x", lower = -10, upper = 10)
sampleValues(p, 4)

p = makeLogicalParam("x")
sampleValues(p, 4)

ps = makeParamSet(
  makeNumericParam("u", lower = 1, upper = 10),
  makeIntegerParam("v", lower = 1, upper = 10),
  makeDiscreteParam("w", values = 1:2)
)
sampleValues(ps, 2)



