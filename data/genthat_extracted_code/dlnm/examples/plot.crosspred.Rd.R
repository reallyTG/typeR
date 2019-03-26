library(dlnm)


### Name: plot.crosspred
### Title: Plot Predictions for a DLNM
### Aliases: plot.crosspred lines.crosspred points.crosspred crossplot
### Keywords: hplot aplot

### ** Examples

### example of application in time series analysis - see vignette("dlnmTS")

# create the crossbasis object for pm10
cb3.pm <- crossbasis(chicagoNMMAPS$pm10, lag=1, argvar=list(fun="lin"),
  arglag=list(fun="strata"))
  
# create the crossbasis object for temperature
varknots <- equalknots(chicagoNMMAPS$temp,fun="bs",df=5,degree=2)
lagknots <- logknots(30, 3)
cb3.temp <- crossbasis(chicagoNMMAPS$temp, lag=30, argvar=list(fun="bs",
  knots=varknots), arglag=list(knots=lagknots))
  
# summarize
summary(cb3.pm)
summary(cb3.temp)

# run the model and get the predictions for temperature
library(splines)
model3 <- glm(death ~  cb3.pm + cb3.temp + ns(time, 7*14) + dow,
  family=quasipoisson(), chicagoNMMAPS)
pred3.temp <- crosspred(cb3.temp, model3, cen=21, by=1)

# 3-D and contour plots
plot(pred3.temp, xlab="Temperature", zlab="RR", theta=200, phi=40, lphi=30,
  main="3D graph of temperature effect")
plot(pred3.temp, "contour", xlab="Temperature", key.title=title("RR"),
  plot.title=title("Contour plot",xlab="Temperature",ylab="Lag"))

# lag-response curves specific to different temperature values
plot(pred3.temp, "slices", var=-20, ci="n", col=1, ylim=c(0.95,1.25), lwd=1.5,
  main="Lag-response curves for different temperatures, ref. 21C")
for(i in 1:3) lines(pred3.temp, "slices", var=c(0,27,33)[i], col=i+1, lwd=1.5)
legend("topright",paste("Temperature =",c(-20,0,27,33)), col=1:4, lwd=1.5)

# in one plot
plot(pred3.temp, "slices", var=c(-20,0,27,33), lag=c(0,5,15,28), col=4,
  ci.arg=list(density=40,col=grey(0.7)))

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
pnest <- crosspred(cbnest,mnest, at=0:20*5, cen=0)

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

### example of general use for regression models - see vignette("dlnmExtended")

# replicate example illustrated in help(ns)
library(splines)
oneheight <- onebasis(women$height, "ns", df=5)
mwomen <- lm(weight ~ oneheight, data=women)
pwomen <- crosspred(oneheight, mwomen, cen=65, at=58:72)
with(pwomen, cbind(allfit, alllow, allhigh)["70",])
plot(pwomen, ci="l", ylab="Weight (lb) difference", xlab="Height (in)", col=4)

# replicate example illustrated in help(gam)
library(mgcv)
dat <- gamSim(1,n=200,dist="poisson",scale=.1)
b2 <- gam(y ~ s(x0,bs="cr") + s(x1,bs="cr") + s(x2,bs="cr") + s(x3,bs="cr"),
  family=poisson, data=dat, method="REML")
plot(b2, select=3)
pgam <- crosspred("x2", b2, cen=0, at=0:100/100)
with(pgam, cbind(allRRfit, allRRlow, allRRhigh)["0.7",])
plot(pgam, ylim=c(0,3), ylab="RR", xlab="x2", col=2)

### example of penalized models - see vignette("dlnmPenalized")

# to be added soon




