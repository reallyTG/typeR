library(ParamHelpers)


### Name: discreteNameToValue
### Title: Convert encoding name(s) to discrete value(s).
### Aliases: discreteNameToValue

### ** Examples

p = makeDiscreteParam("u", values=c(x1 = "a", x2 = "b", x3 = "b"))
discreteNameToValue(p, "x3")



