library(RSiena)


### Name: sienaTimeTest
### Title: Functions to assess and account for time heterogeneity of
###   parameters
### Aliases: sienaTimeTest
### Keywords: models

### ** Examples

## Estimate a restricted model
myalgorithm <- sienaAlgorithmCreate(nsub=1, n3=50)
# Short estimation not for practice, just for having a quick demonstration
mynet1 <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
mydata <- sienaDataCreate(mynet1)
myeff <- getEffects(mydata)
myeff <- includeEffects(myeff, transTrip)
ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE)

## Conduct the score-type test to assess whether heterogeneity is present.
tt <- sienaTimeTest(ans)
summary(tt)

## Suppose that we wish to include time dummies.
## Add them in the following way:
myeff <- includeTimeDummy(myeff, recip, transTrip, timeDummy="2")
ans2 <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE)

## Re-assess the time heterogeneity
(tt2 <- sienaTimeTest(ans2))

## And so on..

## A demonstration of the plotting facilities, on a larger dataset:
## (Of course pasting these identical sets of three waves after each other
##  in a sequence of six is not really meaningful. It's just a demonstration.)

myalgorithm <- sienaAlgorithmCreate(nsub=2, n3=50, seed=1234)
mynet1 <- sienaDependent(array(c(s501, s502, s503, s501, s503, s502),
                               dim=c(50, 50, 6)))
mydata <- sienaDataCreate(mynet1)
myeff <- getEffects(mydata)
myeff <- includeEffects(myeff, transTrip, balance)
myeff <- includeTimeDummy(myeff, density, timeDummy="all")
myeff <- includeTimeDummy(myeff, recip, timeDummy="2,3,5")
myeff <- includeTimeDummy(myeff, balance, timeDummy="4")
## Not run: 
##D (ansp <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE))
##D ttp <- sienaTimeTest(ansp)
##D 
##D ## Pairwise plots show
##D plot(ttp, pairwise=TRUE)
##D 
##D ## Time test plots show
##D plot(ttp, effects=1:4, dims=c(2,2))
## End(Not run)

## Instead of working with includeTimeDummy,
## you can also define time dummies explicitly;
## this may give more control and more clarity:
dum2 <- matrix(c(0,1,0,0,0), nrow=50, ncol=5, byrow=TRUE)
dum3 <- matrix(c(0,0,1,0,0), nrow=50, ncol=5, byrow=TRUE)
dum4 <- matrix(c(0,0,0,1,0), nrow=50, ncol=5, byrow=TRUE)
dum5 <- matrix(c(0,0,0,0,1), nrow=50, ncol=5, byrow=TRUE)
time2 <- varCovar(dum2)
time3 <- varCovar(dum3)
time4 <- varCovar(dum4)
time5 <- varCovar(dum5)
mydata <- sienaDataCreate(mynet1, time2, time3, time4, time5)
myeff <- getEffects(mydata)
myeff <- includeEffects(myeff, transTrip, balance)
## corresponding to includeTimeDummy(myeff, density, timeDummy="all"):
myeff <- includeEffects(myeff, egoX, interaction1='time2')
myeff <- includeEffects(myeff, egoX, interaction1='time3')
myeff <- includeEffects(myeff, egoX, interaction1='time4')
myeff <- includeEffects(myeff, egoX, interaction1='time5')
## corresponding to myeff <- includeTimeDummy(myeff, recip, timeDummy="2,3,5"):
myeff <- includeInteraction(myeff, egoX, recip, interaction1=c('time2', ''))
myeff <- includeInteraction(myeff, egoX, recip, interaction1=c('time3', ''))
myeff <- includeInteraction(myeff, egoX, recip, interaction1=c('time5', ''))
## corresponding to myeff <- includeTimeDummy(myeff, balance, timeDummy="4"):
myeff <- includeInteraction(myeff, egoX, balance, interaction1=c('time4', ''))
## Not run: 
##D (anspp <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE))
##D ## anspp contains identical results as ansp above.
## End(Not run)

## A demonstration of RateX heterogeneity. Note that rate interactions are
## not implemented in general, just for Rate x cCovar.
## Not run: 
##D myalgorithm <- sienaAlgorithmCreate(nsub=4, n3=1000)
##D mynet1 <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
##D myccov <- coCovar(s50a[,1])
##D mydata <- sienaDataCreate(mynet1, myccov)
##D myeff <- getEffects(mydata)
##D myeff <- includeEffects(myeff, transTrip, balance)
##D myeff <- includeTimeDummy(myeff, RateX, type="rate", interaction1="myccov")
##D ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE)
## End(Not run)



