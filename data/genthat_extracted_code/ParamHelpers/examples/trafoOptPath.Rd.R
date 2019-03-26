library(ParamHelpers)


### Name: trafoOptPath
### Title: Transform optimization path.
### Aliases: trafoOptPath

### ** Examples

ps = makeParamSet(
  makeIntegerParam("u", trafo=function(x) 2*x),
  makeNumericVectorParam("v", len=2, trafo=function(x) x/sum(x)),
  makeDiscreteParam("w", values=c("a", "b"))
)
op = makeOptPathDF(ps, y.names="y", minimize=TRUE)
addOptPathEl(op, x=list(3, c(2, 4), "a"), y=0, dob=1, eol=1)
addOptPathEl(op, x=list(4, c(5, 3), "b"), y=2, dob=5, eol=7)

as.data.frame(op)
op = trafoOptPath(op)
as.data.frame(op)



