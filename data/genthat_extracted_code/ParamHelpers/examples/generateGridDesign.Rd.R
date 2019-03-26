library(ParamHelpers)


### Name: generateGridDesign
### Title: Generates a grid design for a parameter set.
### Aliases: generateGridDesign

### ** Examples

ps = makeParamSet(
  makeNumericParam("x1", lower = -2, upper = 1),
  makeNumericParam("x2", lower = -2, upper = 2, trafo = function(x) x^2)
)
generateGridDesign(ps, resolution = c(x1 = 4, x2 = 5), trafo = TRUE)



