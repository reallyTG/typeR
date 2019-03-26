library(funData)


### Name: nObs
### Title: Get the number of observations
### Aliases: nObs

### ** Examples

# Univariate
object <- funData(argvals = 1:5, X = rbind(1:5, 6:10))
nObs(object)

# Univariate (irregular)
irregObject <- irregFunData(argvals = list(1:5, 2:4), X = list(2:6, 3:5))
nObs(irregObject)

# Multivariate
multiObject <- multiFunData(object, funData(argvals = 1:3, X = rbind(3:5, 6:8)))
nObs(multiObject)



