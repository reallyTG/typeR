library(ParamHelpers)


### Name: generateDesign
### Title: Generates a statistical design for a parameter set.
### Aliases: generateDesign

### ** Examples

ps = makeParamSet(
  makeNumericParam("x1", lower = -2, upper = 1),
  makeIntegerParam("x2", lower = 10, upper = 20)
)
# random latin hypercube design with 5 samples:
generateDesign(5, ps)

# with trafo
ps = makeParamSet(
  makeNumericParam("x", lower = -2, upper = 1),
  makeNumericVectorParam("y", len = 2, lower = 0, upper = 1, trafo = function(x) x/sum(x))
)
generateDesign(10, ps, trafo = TRUE)



