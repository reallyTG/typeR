library(RSiena)


### Name: RSiena-package
### Title: Simulation Investigation for Empirical Network Analysis
### Aliases: RSiena-package RSiena
### Keywords: package

### ** Examples

mynet1 <- sienaDependent(array(c(tmp3, tmp4), dim=c(32, 32, 2)))
mydata <- sienaDataCreate(mynet1)
myeff <- getEffects(mydata)
myeff <- includeEffects(myeff, transTrip)
myeff
myalgorithm <- sienaAlgorithmCreate(nsub=3, n3=200)
ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE)
summary(ans)



