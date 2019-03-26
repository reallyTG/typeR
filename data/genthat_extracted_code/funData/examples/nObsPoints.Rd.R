library(funData)


### Name: nObsPoints
### Title: Get the number of observation points
### Aliases: nObsPoints

### ** Examples

# Univariate (one-dimensional)
object1 <- funData(argvals = 1:5, X = rbind(1:5, 6:10))
nObsPoints(object1)

# Univariate (two-dimensional)
object2 <- funData(argvals = list(1:5, 1:6), X = array(1:60, dim = c(2, 5, 6)))
nObsPoints(object2)

# Multivariate
multiObject <- multiFunData(object1, object2)
nObsPoints(multiObject)

# Univariate (irregular)
irregObject <- irregFunData(argvals = list(1:5, 2:4), X = list(2:6, 3:5))
nObsPoints(irregObject)



