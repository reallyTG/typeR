library(DstarM)


### Name: testFun
### Title: Test fun.density with lower and upper bounds
### Aliases: testFun

### ** Examples

lower = c(.5, -6, .1, 0, 0)
upper = c(2, 6, .99, .99, 10)
args = list(t = seq(0, 5, .01), pars = lower, boundary = 'lower',
DstarM = TRUE)
testFun(fun.density = Voss.density, lower = lower, upper = upper,
args = args)
# TRUE



