library(dlnm)


### Name: crossbasis
### Title: Generate a Cross-Basis Matrix for a DLNM
### Aliases: crossbasis summary.crossbasis
### Keywords: smooth ts

### ** Examples

### example of application in time series analysis - see vignette("dlnmTS")

# create the crossbasis objects and summarize their contents
cb1.pm <- crossbasis(chicagoNMMAPS$pm10, lag=15, argvar=list(fun="lin"),
  arglag=list(fun="poly",degree=4))
cb1.temp <- crossbasis(chicagoNMMAPS$temp, lag=3, argvar=list(df=5),
  arglag=list(fun="strata",breaks=1))
summary(cb1.pm)
summary(cb1.temp)

# run the model and get the predictions for pm10
library(splines)
model1 <- glm(death ~ cb1.pm + cb1.temp + ns(time, 7*14) + dow,
  family=quasipoisson(), chicagoNMMAPS)
pred1.pm <- crosspred(cb1.pm, model1, at=0:20, bylag=0.2, cumul=TRUE)

# plot the lag-response curves for specific and incremental cumulative effects
plot(pred1.pm, "slices", var=10, col=3, ylab="RR", ci.arg=list(density=15,lwd=2),
  main="Lag-response curve for a 10-unit increase in PM10")
plot(pred1.pm, "slices", var=10, col=2, cumul=TRUE, ylab="Cumulative RR",
  main="Lag-response curve of incremental cumulative effects")

### example of application beyond time series - see vignette("dlnmExtended")

# generate the matrix of exposure histories from the 5-year periods
Qnest <- t(apply(nested, 1, function(sub) exphist(rep(c(0,0,0,sub[5:14]), 
  each=5), sub["age"], lag=c(3,40))))

# define the cross-basis
cbnest <- crossbasis(Qnest, lag=c(3,40), argvar=list("bs",degree=2,df=3),
  arglag=list(fun="ns",knots=c(10,30),intercept=FALSE))
summary(cbnest)

# run the model and predict
library(survival)
mnest <- clogit(case~cbnest+strata(riskset), nested)
pnest <- crosspred(cbnest,mnest, cen=0, at=0:20*5)

# bi-dimensional exposure-lag-response association
plot(pnest, zlab="OR", xlab="Exposure", ylab="Lag (years)")
# lag-response curve for dose 60
plot(pnest, var=50, ylab="OR for exposure 50", xlab="Lag (years)", xlim=c(0,40))
# exposure-response curve for lag 10
plot(pnest, lag=5, ylab="OR at lag 5", xlab="Exposure", ylim=c(0.95,1.15))

### example of extended predictions - see vignette("dlnmExtended")

# compute exposure profiles and exposure history
expnested <- rep(c(10,0,13), c(5,5,10))
hist <- exphist(expnested, time=length(expnested), lag=c(3,40))

# predict association with a specific exposure history
pnesthist <- crosspred(cbnest, mnest, cen=0, at=hist)
with(pnesthist, c(allRRfit,allRRlow,allRRhigh))

### example of user-defined functions - see vignette("dlnmExtended")

# define a log function
mylog <- function(x) log(x+1)

# define the cross-basis
cbnest2 <- crossbasis(Qnest, lag=c(3,40), argvar=list("mylog"),
  arglag=list(fun="ns",knots=c(10,30),intercept=FALSE))
summary(cbnest2)

# run the model and predict
mnest2 <- clogit(case~cbnest2+strata(riskset), nested)
pnest2 <- crosspred(cbnest2, mnest2, cen=0, at=0:20*5)

# plot and compare with previous fit
plot(pnest2, zlab="OR", xlab="Exposure", ylab="Lag (years)")
plot(pnest2, var=50, ylab="OR for exposure 50", xlab="Lag (years)", xlim=c(0,40))
lines(pnest, var=50, lty=2)
plot(pnest2, lag=5, ylab="OR at lag 5", xlab="Exposure", ylim=c(0.95,1.15))
lines(pnest, lag=5, lty=2)

### example of penalized models - see vignette("dlnmPenalized")

# to be added soon




