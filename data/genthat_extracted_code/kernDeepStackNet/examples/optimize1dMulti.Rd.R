library(kernDeepStackNet)


### Name: optimize1dMulti
### Title: One dimensional optimization of multivariate loss functions
### Aliases: optimize1dMulti
### Keywords: models & regression

### ** Examples

library(globalOptTests)
# Two dimensional task
getDefaultBounds("AluffiPentini")
oneDres <- optimize1dMulti (f_input=function (x) 
goTest (x, fnName="AluffiPentini", checkDim=TRUE), 
maxRuns=3, repetitions=5, lower=rep(-12, 2), upper=rep(10, 2),
tol_input=.Machine$double.eps^0.25)
abs(oneDres$objective-getGlobalOpt("AluffiPentini"))

# Four dimensional optimization task
getDefaultBounds("CosMix4")
oneDres <- optimize1dMulti (f_input=function (x) 
goTest (x, fnName="CosMix4", checkDim=TRUE), 
maxRuns=3, repetitions=5, lower=rep(-2, 4), upper=rep(1, 4),
tol_input=.Machine$double.eps^0.25)
abs(oneDres$objective-getGlobalOpt("CosMix4"))

# Ten dimensional optimization task
getDefaultBounds("Rastrigin")
oneDres <- optimize1dMulti (f_input=function (x) 
goTest (x, fnName="Rastrigin", checkDim=TRUE), 
maxRuns=3, repetitions=5, lower=rep(-525, 10), upper=rep(512, 10),
tol_input=.Machine$double.eps^0.25)
abs(oneDres$objective-getGlobalOpt("Rastrigin"))

# Ten dimensional optimization task with higher accuracy
getDefaultBounds("Rastrigin")
oneDres <- optimize1dMulti (f_input=function (x) 
goTest (x, fnName="Rastrigin", checkDim=TRUE), 
maxRuns=3, repetitions=5, lower=rep(-525, 10), upper=rep(512, 10),
tol_input=.Machine$double.eps^0.5)
abs(oneDres$objective-getGlobalOpt("Rastrigin"))



