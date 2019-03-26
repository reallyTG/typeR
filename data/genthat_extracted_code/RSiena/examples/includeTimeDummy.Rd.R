library(RSiena)


### Name: includeTimeDummy
### Title: Function to include time dummy effects in a Siena model
### Aliases: includeTimeDummy
### Keywords: models

### ** Examples

## Not run: 
##D ## Estimate a restricted model
##D myalgorithm <- sienaAlgorithmCreate(nsub=4, n3=1000)
##D mynet1 <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
##D mydata <- sienaDataCreate(mynet1)
##D myeff <- getEffects(mydata)
##D myeff <- includeEffects(myeff, transTrip, balance)
##D myeff
##D (ans <- siena07(myalgorithm, data=mydata, effects=myeff))
##D 
##D ## Conduct the score type test to assess whether heterogeneity is present.
##D tt <- sienaTimeTest(ans)
##D summary(tt)
##D 
##D ## Suppose that we wish to include a time dummy.
##D ## Since there are three waves, the number of periods is two.
##D ## This means that only one time dummy can be included for
##D ## the interactions. The default is for period 2;
##D ## an equivalent model, but with different parameters
##D ## (that can be transformed into each other) is obtained
##D ## when the dummies are defined for period 1.
##D myeff <- includeTimeDummy(myeff, density, recip, timeDummy="2")
##D myeff       # Note the \code{timeDummy} column.
##D (ans2 <- siena07(myalgorithm, data=mydata, effects=myeff))
##D 
##D ## Re-assess the time heterogeneity
##D tt2 <- sienaTimeTest(ans2)
##D summary(tt2)
##D 
##D ## And so on..
## End(Not run)

## A demonstration of RateX heterogeneity.
## Note that rate interactions are not implemented in general,
## but they are for Rate x coCovar.
## Not run: 
##D myalgorithm <- sienaAlgorithmCreate(nsub=4, n3=1000)
##D mynet1 <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
##D myccov <- coCovar(s50a[,1])
##D mydata <- sienaDataCreate(mynet1, myccov)
##D myeff <- getEffects(mydata)
##D myeff <- includeEffects(myeff, transTrip, balance)
##D myeff <- includeTimeDummy(myeff, RateX, type="rate",
##D             interaction1="myccov")
##D myeff
##D (ans <- siena07(myalgorithm, data=mydata, effects=myeff))
## End(Not run)



