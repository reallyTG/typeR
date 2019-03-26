library(bshazard)


### Name: bshazard
### Title: Nonparametric Smoothing of the Hazard Function
### Aliases: bshazard bshazard.default
### Keywords: survival nonparametric smooth

### ** Examples

data(lung,package="survival")
  fit<-bshazard(Surv(time, status==2) ~ 1,data=lung)
  plot(fit$time, fit$hazard,xlab='Time', ylab='Rate/person-days',type='l')
  points(fit$raw.data$time,fit$raw.data$raw.hazard,cex=.3, lwd=3,col=1)
  lines(fit$time, fit$hazard, lty=1, lwd=3)
  lines(fit$time, fit$lower.ci, lty=1, lwd=1)
lines(fit$time, fit$upper.ci, lty=1, lwd=1)
# or alternatively
plot(fit)


#Example to graphically evaluate the Markov assumpion in an illness-death model
### data simulated under EXTENDED SEMI-MARKOV model
set.seed(123)
n  <- 500
beta<-log(3)
R  <- runif(n, min = 0, max =2)
cat <- cut(R, breaks = seq(0,2,0.5), labels = seq(1,4,1))
T12  <- 1/0.2*( (-log(runif(n, min = 0, max = 1))) / (exp(beta*R)))**(1/0.6)
C  <- runif(n, min =0, max = 10)
T12obs <- pmin(T12, C)
status  <- ifelse(T12obs < C, 1, 0)
T012obs <- R+T12obs
#R: simulated time to illness
#cat: time to illness categorised in 4 classes
#T12obs:  time from illness to death or censoring
#T012obs: time from origin to death or censoring
#status: indicator of death (1=death,0=censoring)

# Hazard estimate in the Clock Reset scale (time from illness) by time to illness class
fit <- bshazard(Surv(T12obs[cat == 1],status[cat==1]) ~ 1)
plot(fit,conf.int=FALSE,xlab='Time since illness',xlim=c(0,5),ylim=c(0,10),lwd=2,col=rainbow(1))
for(i in 2:4) {
  fit <- bshazard(Surv(T12obs[cat == i],status[cat==i]) ~ 1)
  lines(fit$time, fit$hazard, type = 'l', lwd = 2, col = rainbow(4)[i])
}
legend("top",title="Time to illness",c("<=0.5","0.5-|1","1-|1.5","1.5-|2"),col=c(rainbow(4)),lwd =2)

# Hazard estimate in the Clock Forward scale (time from origin) by time to illness class
fit <- bshazard(Surv(R[cat == 1],T012obs[cat == 1],status[cat==1]) ~ 1)
plot(fit,conf.int=FALSE,xlab='Time since origin',xlim=c(0,5),ylim=c(0,10),lwd=2,col=rainbow(1))
for(i in 2:4) {
  fit <- bshazard(Surv(R[cat == i],T012obs[cat == i],status[cat==i]) ~ 1)
  lines(fit$time, fit$hazard, type = 'l', lwd = 2, col = rainbow(4)[i])
}
legend("top",title="Time to illness",c("<=0.5","0.5-|1","1-|1.5","1.5-|2"),col=c(rainbow(4)),lwd =2)

#Alternatively an adjusted estimate can be performed, assuming proportionl hazard. 
##This computation can be time consuming!
## Not run: 
##D fit.adj <- bshazard(Surv(T12obs,status) ~ cat )
##D plot(fit.adj,overall=FALSE, xlab = 'Time since illness',col=rainbow(4),lwd=2, xlim = c(0,5), 
##D ylim = c(0,10))
##D legend("top",title="Time to illness",c("<=0.5","0.5-|1","1-|1.5","1.5-|2"),col=c(rainbow(4)),lwd =2)
## End(Not run)

### A more general setting with examples of Markov assumption evaluation can be found 
### in Bernasconi et al. Stat in Med 2016
## The function is currently defined as
function (x, ...) 
UseMethod("bshazard")



