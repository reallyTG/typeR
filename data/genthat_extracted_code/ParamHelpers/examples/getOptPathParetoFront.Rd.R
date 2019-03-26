library(ParamHelpers)


### Name: getOptPathParetoFront
### Title: Get indices of pareto front of optimization path.
### Aliases: getOptPathParetoFront

### ** Examples

ps = makeParamSet(makeNumericParam("x"))
op = makeOptPathDF(par.set = ps, y.names = c("y1", "y2"), minimize = c(TRUE, TRUE))
addOptPathEl(op, x = list(x = 1), y = c(5, 3))
addOptPathEl(op, x = list(x = 2), y = c(2, 4))
addOptPathEl(op, x = list(x = 3), y = c(9, 4))
addOptPathEl(op, x = list(x = 4), y = c(4, 9))
as.data.frame(op)
getOptPathParetoFront(op)
getOptPathParetoFront(op, index = TRUE)



