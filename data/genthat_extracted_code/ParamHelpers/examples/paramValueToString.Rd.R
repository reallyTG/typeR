library(ParamHelpers)


### Name: paramValueToString
### Title: Convert a value to a string.
### Aliases: paramValueToString

### ** Examples

p = makeNumericParam("x")
paramValueToString(p, 1)
paramValueToString(p, 1.2345)
paramValueToString(p, 0.000039)
paramValueToString(p, 8.13402, num.format = "%.2f")

p = makeIntegerVectorParam("x", len=2)
paramValueToString(p, c(1L, 2L))

p = makeLogicalParam("x")
paramValueToString(p, TRUE)

p = makeDiscreteParam("x", values=list(a=NULL, b=2))
paramValueToString(p, NULL)

ps = makeParamSet(
  makeNumericVectorParam("x", len=2L),
  makeDiscreteParam("y", values=list(a=NULL, b=2))
)
paramValueToString(ps, list(x=c(1,2), y=NULL))



