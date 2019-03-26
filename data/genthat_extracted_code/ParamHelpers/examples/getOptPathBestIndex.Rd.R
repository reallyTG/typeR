library(ParamHelpers)


### Name: getOptPathBestIndex
### Title: Get index of the best element from optimization path.
### Aliases: getOptPathBestIndex

### ** Examples

ps = makeParamSet(makeNumericParam("x"))
op = makeOptPathDF(par.set = ps, y.names = "y", minimize = TRUE)
addOptPathEl(op, x = list(x = 1), y = 5)
addOptPathEl(op, x = list(x = 2), y = 3)
addOptPathEl(op, x = list(x = 3), y = 9)
addOptPathEl(op, x = list(x = 4), y = 3)
as.data.frame(op)
getOptPathBestIndex(op)
getOptPathBestIndex(op, ties = "first")



