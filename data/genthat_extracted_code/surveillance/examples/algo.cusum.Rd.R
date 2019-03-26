library(surveillance)


### Name: algo.cusum
### Title: CUSUM method
### Aliases: algo.cusum
### Keywords: classif

### ** Examples

# Xi ~ Po(5), i=1,...,500
disProgObj <- create.disProg(week=1:500, observed= rpois(500,lambda=5),
                             state=rep(0,500))
# there should be no alarms as mean doesn't change
res <- algo.cusum(disProgObj, control = list(range = 100:500,trans="anscombe"))
plot(res)

# simulated data 
disProgObj <- sim.pointSource(p = 1, r = 1, length = 250,
                              A = 0, alpha = log(5), beta = 0, phi = 10,
                              frequency = 10, state = NULL, K = 0)                           
plot(disProgObj)

# Test week 200 to 250 for outbreaks
surv <- algo.cusum(disProgObj, control = list(range = 200:250))
plot(surv)



