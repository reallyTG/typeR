library(funData)


### Name: norm
### Title: Calculate the norm of functional data
### Aliases: norm

### ** Examples

# Univariate
object <- funData(argvals = 1:5, X = rbind(1:5, 6:10))
norm(object)

# Univariate (irregular)
irregObject <- irregFunData(argvals = list(1:5, 2:4), X = list(2:6, 3:5))
norm(irregObject) # no extrapolation
norm(irregObject, fullDom = TRUE) # extrapolation (of second function)

# Multivariate
multiObject <- multiFunData(object, funData(argvals = 1:3, X = rbind(3:5, 6:8)))
norm(multiObject)
norm(multiObject, weight = c(2,1)) # with weight vector, giving more weight to the first element



