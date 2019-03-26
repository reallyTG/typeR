library(ParamHelpers)


### Name: makeParamSet
### Title: Construct a parameter set.
### Aliases: makeParamSet ParamSet makeNumericParamSet

### ** Examples

makeParamSet(
  makeNumericParam("u", lower=1),
  makeIntegerParam("v", lower=1, upper=2),
  makeDiscreteParam("w", values=1:2),
  makeLogicalParam("x"),
  makeDiscreteVectorParam("y", len=2, values=c("a", "b"))
)
makeParamSet(
  makeNumericParam("u", lower = expression(ceiling(n))),
  makeIntegerParam("v", lower = expression(floor(n)), upper = 2),
  keys = c("p", "n")
)



