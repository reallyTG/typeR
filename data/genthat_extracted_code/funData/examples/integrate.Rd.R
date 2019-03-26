library(funData)


### Name: integrate
### Title: Integrate functional data
### Aliases: integrate

### ** Examples

# Univariate
object <- funData(argvals = 1:5, X = rbind(1:5, 6:10))
integrate(object)

# Univariate (irregular)
irregObject <-irregFunData(argvals = list(1:5, 2:4), X = list(2:6, 3:5))
integrate(irregObject) # fullDom = FALSE
integrate(irregObject, fullDom = TRUE)

# Multivariate
multiObject <- multiFunData(object, funData(argvals = 1:3, X = rbind(3:5, 6:8)))
integrate(multiObject)



