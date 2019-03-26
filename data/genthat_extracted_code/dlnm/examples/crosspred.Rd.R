library(dlnm)


### Name: crosspred
### Title: Generate Predictions for a DLNM
### Aliases: crosspred summary.crosspred
### Keywords: smooth ts

### ** Examples

### example of application in time series analysis - see vignette("dlnmTS")

# seasonal analysis: select summer months only
chicagoNMMAPSseas <- subset(chicagoNMMAPS, month>5 & month<10)

# create the crossbasis objects, including info on groups
cb2.o3 <- crossbasis(chicagoNMMAPSseas$o3, lag=5,
  argvar=list(fun="thr",thr=40.3), arglag=list(fun="integer"),
  group=chicagoNMMAPSseas$year)
cb2.temp <- crossbasis(chicagoNMMAPSseas$temp, lag=10,
  argvar=list(fun="thr",thr=c(15,25)), arglag=list(fun="strata",breaks=c(2,6)),
  group=chicagoNMMAPSseas$year)
summary(cb2.o3)
summary(cb2.temp)

# run the model
library(splines)
model2 <- glm(death ~  cb2.o3 + cb2.temp + ns(doy, 4) + ns(time,3) + dow,
  family=quasipoisson(), chicagoNMMAPSseas)
  
# get the predictions for o3 at specific exposure values
pred2.o3 <- crosspred(cb2.o3, model2, at=c(0:65,40.3,50.3))

# get figures for the overall cumulative association, with ci
pred2.o3$allRRfit["50.3"]
cbind(pred2.o3$allRRlow, pred2.o3$allRRhigh)["50.3",]

# plot the estimated lag-response curve (with 80%CI)
plot(pred2.o3, "slices", var=50.3, ci="bars", type="p", col=2, pch=19,
  ci.level=0.80, main="Lag-response a 10-unit increase above threshold (80CI)")
# plot the estimated overall cumulative exposure-response curve
plot(pred2.o3,"overall",xlab="Ozone", ci="l", col=3, ylim=c(0.9,1.3), lwd=2,
  ci.arg=list(col=1,lty=3), main="Overall cumulative association for 5 lags")
  
# plot the estimated exposure-lag-response surface
plot(pred2.o3, xlab="Ozone", main="3D: default perspective")
plot(pred2.o3, xlab="Ozone", main="3D: different perspective", theta=250, phi=40)

### example of application beyond time series - see vignette("dlnmExtended")

# generate the matrix of exposure histories from the weekly data
Qdrug <- as.matrix(drug[,rep(7:4, each=7)])
colnames(Qdrug) <- paste("lag", 0:27, sep="")

# define the cross-basis
cbdrug <- crossbasis(Qdrug, lag=27, argvar=list("lin"),
  arglag=list(fun="ns",knots=c(9,18)))

# run the model, predict, and show estimates for specific values
mdrug <- lm(out~cbdrug+sex, drug)
pdrug <- crosspred(cbdrug, mdrug, at=0:20*5)
with(pdrug,cbind(allfit,alllow,allhigh)["50",])
pdrug$matfit["20","lag3"]

# bi-dimensional exposure-lag-response association
plot(pdrug, zlab="Effect", xlab="Dose", ylab="Lag (days)")
plot(pdrug, var=60, ylab="Effect at dose 60", xlab="Lag (days)", ylim=c(-1,5))
plot(pdrug, lag=10, ylab="Effect at lag 10", xlab="Dose", ylim=c(-1,5))

### example of extended predictions - see vignette("dlnmExtended")

# dose 20 for 10 days
histdrug <- exphist(rep(20,10), time=10, lag=27)
pdrug4 <- crosspred(cbdrug, mdrug, at=histdrug)
with(pdrug4,c(allfit,alllow,allhigh))

# define exposure profile with weekly exposures to 10, 50, 0 and 20
expdrug <- rep(c(10,50,0,20),c(2,1,1,2)*7)

# define the exposure histories for all the time points
dynhist <- exphist(expdrug, lag=27)

# predict the effects
pdyndrug <- crosspred(cbdrug, mdrug, at=dynhist)

# plot of the evolution of the effects along time given the doses
plot(pdyndrug,"overall", ylab="Effect", xlab="Time (days)", ylim=c(-5,27), 
  xlim=c(1,50))

### example of user-defined functions - see vignette("dlnmExtended")

# define the decay function
fdecay <- function(x, scale=5, ...) {
  basis <- exp(-x/scale)
  attributes(basis)$scale <- scale
  return(basis)
}

# define the cross-basis
cbdrug2 <- crossbasis(Qdrug, lag=27, argvar=list("lin"),
  arglag=list(fun="fdecay",scale=6))
summary(cbdrug2)

# run the model and predict
mdrug2 <- lm(out~cbdrug2+sex, drug)
pdrug2 <- crosspred(cbdrug2, mdrug2, at=0:20*5)

# plot and compare with previous fit
plot(pdrug2, zlab="Effect", xlab="Dose", ylab="Lag (days)")
plot(pdrug2, var=60, ylab="Effect at dose 60", xlab="Lag (days)", ylim=c(-1,5))
lines(pdrug, var=60, lty=2)
plot(pdrug2, lag=10, ylab="Effect at lag 10", xlab="Dose", ylim=c(-1,5))
lines(pdrug, lag=10, lty=2)

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




