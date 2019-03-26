library(RSiena)


### Name: plot.sienaTimeTest
### Title: Functions to plot assessment of time heterogeneity of parameters
### Aliases: plot.sienaTimeTest
### Keywords: models

### ** Examples

## Not run: 
##D myalgorithm <- sienaAlgorithmCreate(nsub=4, n3=500)
##D mynet1 <- sienaDependent(array(c(s501, s502, s503, s501, s503, s502), dim=c(50, 50, 6)))
##D mydata <- sienaDataCreate(mynet1)
##D myeff <- getEffects(mydata)
##D myeff <- includeEffects(myeff, transTrip, balance)
##D myeff <- includeTimeDummy(myeff, recip, timeDummy="2,3,5")
##D myeff <- includeTimeDummy(myeff, balance, timeDummy="4")
##D myeff <- includeTimeDummy(myeff, density, timeDummy="all")
##D ansp <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE)
##D ttp <- sienaTimeTest(ansp)
##D 
##D ## Pairwise plots show
##D plot(ttp, pairwise=TRUE)
##D 
##D ## Time test plots show
##D plot(ttp, effects=1:3) ## default layout
##D plot(ttp, effects=1:3, layout=c(3,1))
## End(Not run)



