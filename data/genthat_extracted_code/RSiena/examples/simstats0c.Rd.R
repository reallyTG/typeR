library(RSiena)


### Name: simstats0c
### Title: Versions of FRAN
### Aliases: simstats0c maxlikec initializeFRAN terminateFRAN
### Keywords: models

### ** Examples


mynet1 <- sienaNet(array(c(tmp3, tmp4), dim=c(32, 32, 2)))
mydata <- sienaDataCreate(mynet1)
myeff <- getEffects(mydata)
myeff <- includeEffects(myeff, transTrip)
myalgorithm <- sienaAlgorithmCreate(fn=simstats0c, nsub=2, n3=100)
ans <- siena07(myalgorithm, data=mydata, effects=myeff,  batch=TRUE)



