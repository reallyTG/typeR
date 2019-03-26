library(bbmle)


### Name: profile.mle2-class
### Title: Methods for likelihood profiles
### Aliases: profile.mle2-class confint,profile.mle2-method
###   confint,mle2-method confint.mle2 plot,profile.mle2-method
###   plot,profile.mle2,missing-method show,profile.mle2-method
###   plot.profile.mle2
### Keywords: classes

### ** Examples

x <- 0:10
y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
d <- data.frame(x,y)
## we have a choice here: (1) don't impose boundaries on the parameters,
##  put up with warning messages about NaN values: 
fit1 <- mle2(y~dpois(lambda=ymax/(1+x/xhalf)),
     start=list(ymax=1,xhalf=1),
     data=d)
p1 <- suppressWarnings(profile(fit1))
plot(p1,main=c("first","second"),
     xlab=c(~y[max],~x[1/2]),ylab="Signed square root deviance",
     show.points=TRUE)
suppressWarnings(confint(fit1)) ## recomputes profile
confint(p1)  ## operates on existing profile
suppressWarnings(confint(fit1,method="uniroot"))
## alternatively, we can use box constraints to keep ourselves
##  to positive parameter values ...
fit2 <- update(fit1,method="L-BFGS-B",lower=c(ymax=0.001,xhalf=0.001))
## Not run: 
##D p2 <- profile(fit2)
##D plot(p2,show.points=TRUE)
##D ## but the fit for ymax is just bad enough that the spline gets wonky
##D confint(p2)  ## now we get a warning
##D confint(fit2,method="uniroot")
##D ## bobyqa is a better-behaved bounded optimizer ...
##D ##  BUT recent (development, 2012.5.24) versions of
##D ##    optimx no longer allow single-parameter fits!
##D if (require(optimx)) {
##D   fit3 <- update(fit1,
##D       optimizer="optimx",
##D       method="bobyqa",lower=c(ymax=0.001,xhalf=0.001))
##D    p3 <- profile(fit3)
##D    plot(p3,show.points=TRUE)
##D   confint(p3)
##D }
## End(Not run)



