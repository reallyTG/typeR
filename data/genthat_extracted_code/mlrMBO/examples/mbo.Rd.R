library(mlrMBO)


### Name: mbo
### Title: Optimizes a function with sequential model based optimization.
### Aliases: mbo

### ** Examples

# simple 2d objective function
obj.fun = makeSingleObjectiveFunction(
 fn = function(x) x[1]^2 + sin(x[2]),
 par.set = makeNumericParamSet(id = "x", lower = -1, upper = 1, len = 2)
)

# create base control object
ctrl = makeMBOControl()

# do three MBO iterations
ctrl = setMBOControlTermination(ctrl, iters = 3L)

# use 500 points in the focussearch (should be sufficient for 2d)
ctrl = setMBOControlInfill(ctrl, opt.focussearch.points = 500)
# create initial design
des = generateDesign(n = 5L, getParamSet(obj.fun), fun = lhs::maximinLHS)

# start mbo
res = mbo(obj.fun, design = des, control = ctrl)

print(res)
## Not run: 
##D plot(res)
## End(Not run)



