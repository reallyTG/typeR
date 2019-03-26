library(simecol)


### Name: fitOdeModel
### Title: Parameter Fitting for odeModel Objects
### Aliases: fitOdeModel
### Keywords: misc

### ** Examples


## ======== load example model =========
data(chemostat)

#source("chemostat.R")

## derive scenarios
cs1 <- cs2 <- chemostat

## generate some noisy data
parms(cs1)[c("vm", "km")] <- c(2, 10)
times(cs1) <- c(from=0, to=20, by=2)
yobs <- out(sim(cs1))
obstime <- yobs$time
yobs$time <- NULL
yobs$S <- yobs$S + rnorm(yobs$S, sd= 0.1 * sd(yobs$S))*2
yobs$X <- yobs$X + rnorm(yobs$X, sd= 0.1 * sd(yobs$X))

## ======== optimize it! =========

## time steps for simulation, either small for rk4 fixed step
# times(cs2)["by"] <- 0.1
# solver(cs2) <- "rk4"

## or, faster: use lsoda and and return only required steps that are in the data
times(cs2) <- obstime
solver(cs2) <- "lsoda"

## Nelder-Mead (default)
whichpar  <- c("vm", "km")

res <- fitOdeModel(cs2, whichpar=whichpar, obstime, yobs,
  debuglevel=0,
  control=list(trace=TRUE))

coef(res)

## assign fitted parameters to the model, i.e. as start values for next step
parms(cs2)[whichpar] <- coef(res)

## alternatively, L-BFGS-B (allows lower and upper bounds for parameters)
res <- fitOdeModel(cs2, whichpar=c("vm", "km"), obstime, yobs,
  debuglevel=0, fn = ssqOdeModel,
  method = "L-BFGS-B", lower = 0,
  control=list(trace=TRUE),
  atol=1e-4, rtol=1e-4)

coef(res)

## alternative 2, transform parameters to constrain unconstrained method
## Note: lower and upper are *named* vectors
res <- fitOdeModel(cs2, whichpar=c("vm", "km"), obstime, yobs,
  debuglevel=0, fn = ssqOdeModel,
  method = "BFGS", lower = c(vm=0, km=0), upper=c(vm=4, km=20),
  control=list(trace=TRUE),
  atol=1e-4, rtol=1e-4)

coef(res)


## alternative 3a, use PORT algorithm
parms(cs2)[whichpar] <- c(vm=1, km=2)

lower <- c(vm=0, km=0)
upper <- c(vm=4, km=20)

res <- fitOdeModel(cs2, whichpar=c("vm", "km"), obstime, yobs,
  debuglevel=0, fn = ssqOdeModel,
  method = "PORT", lower = lower, upper = upper,
  control=list(trace=TRUE),
  atol=1e-4, rtol=1e-4)

coef(res)

## alternative 3b, PORT algorithm with manual parameter scaling
res <- fitOdeModel(cs2, whichpar=c("vm", "km"), obstime, yobs,
  debuglevel=0, fn = ssqOdeModel,
  method = "PORT", lower = lower, upper = upper, scale.par = 1/upper,
  control=list(trace=TRUE),
  atol=1e-4, rtol=1e-4)

coef(res)

## set model parameters to  fitted values and simulate again
parms(cs2)[whichpar] <- coef(res)
times(cs2) <- c(from=0, to=20, by=1)
ysim <- out(sim(cs2))

## plot results
par(mfrow=c(2,1))
plot(obstime, yobs$X, ylim = range(yobs$X, ysim$X))
lines(ysim$time, ysim$X, col="red")
plot(obstime, yobs$S, ylim= range(yobs$S, ysim$S))
lines(ysim$time, ysim$S, col="red")




