library(funData)


### Name: extractObs
### Title: Extract observations of functional data
### Aliases: extractObs subset,funData-method subset,multiFunData-method
###   subset,irregFunData-method [,funData,ANY,missing,missing-method
###   [,multiFunData,ANY,missing,missing-method
###   [,irregFunData,ANY,missing,missing-method

### ** Examples

# Univariate - one-dimensional domain
object1 <- funData(argvals = 1:5, X = rbind(1:5, 6:10))
extractObs(object1, obs = 1)
extractObs(object1, argvals = 1:3)
extractObs(object1, argvals = list(1:3)) # the same as the statement before
# alias
subset(object1, argvals = 1:3)

# Univariate - two-dimensional domains
object2 <- funData(argvals = list(1:5, 1:6), X = array(1:60, dim = c(2, 5, 6)))
extractObs(object2, obs = 1)
extractObs(object2, argvals = list(1:3, c(2,4,6))) # argvals must be supplied as list

# Univariate - irregular
irregObject <- irregFunData(argvals = list(1:5, 2:4), X = list(2:6, 3:5))
extractObs(irregObject, obs = 2)
extractObs(irregObject, argvals = 1:3)
extractObs(irregObject, argvals = c(1,5)) # throws a warning, as second function has no observations

# Multivariate
multiObject <- multiFunData(object1, object2)
extractObs(multiObject, obs = 2)
multiObject[2] # shorthand
extractObs(multiObject, argvals = list(1:3, list(1:3, c(2,4,6))))


### Shorthand via "[]"
object1[1]
object1[argvals = 1:3]
object2[1] 
object2[argvals = list(1:3, c(2,4,6))]
irregObject[2]
irregObject[argvals = 1:3]



