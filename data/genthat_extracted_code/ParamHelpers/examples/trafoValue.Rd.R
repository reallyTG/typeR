library(ParamHelpers)


### Name: trafoValue
### Title: Transform a value.
### Aliases: trafoValue

### ** Examples

# transform simple parameter:
p = makeNumericParam(id="x", trafo=function(x) x^2)
trafoValue(p, 2)
# for a parameter set different transformation functions are possible:
ps = makeParamSet(
  makeIntegerParam("u", trafo=function(x) 2*x),
  makeNumericVectorParam("v", len=2, trafo=function(x) x/sum(x)),
  makeDiscreteParam("w", values=c("a", "b"))
)
# now the values of "u" and "v" are transformed:
trafoValue(ps, list(3, c(2, 4), "a"))



