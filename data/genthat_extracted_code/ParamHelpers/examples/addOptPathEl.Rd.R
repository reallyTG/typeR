library(ParamHelpers)


### Name: addOptPathEl
### Title: Add a new element to an optimization path.
### Aliases: addOptPathEl

### ** Examples

ps = makeParamSet(
  makeNumericParam("p1"),
  makeDiscreteParam("p2", values = c("a", "b"))
)
op = makeOptPathDF(par.set = ps, y.names = "y", minimize = TRUE)
addOptPathEl(op, x = list(p1 = 7, p2 = "b"), y = 1)
addOptPathEl(op, x = list(p1 = -1, p2 = "a"), y = 2)
as.data.frame(op)



