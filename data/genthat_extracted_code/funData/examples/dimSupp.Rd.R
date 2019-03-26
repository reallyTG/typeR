library(funData)


### Name: dimSupp
### Title: Support dimension of functional data
### Aliases: dimSupp

### ** Examples

# Univariate (one-dimensional)
object1 <- funData(argvals = 1:5, X = rbind(1:5, 6:10))
dimSupp(object1)

# Univariate (two-dimensional)
object2 <- funData(argvals = list(1:10, 1:5), X = array(rnorm(100), dim = c(2,10,5)))
dimSupp(object2)

# Univariate (irregular)
irregObject <- irregFunData(argvals = list(1:5, 2:4), X = list(2:6, 3:5))
dimSupp(irregObject)

# Multivariate
multiObject <- multiFunData(object1, object2)
dimSupp(multiObject)



