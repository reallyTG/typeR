library(cfma)


### Name: FMA.concurrent
### Title: Functional mediation analysis under concurrent regression model
### Aliases: FMA.concurrent
### Keywords: models

### ** Examples


##################################################
# Concurrent functional mediation model
data(env.concurrent)
Z<-get("Z",env.concurrent)
M<-get("M",env.concurrent)
Y<-get("Y",env.concurrent)

# consider Fourier basis
fit<-FMA.concurrent(Z,M,Y,intercept=FALSE,timeinv=c(0,300))

# estimate of alpha
plot(fit$M$curve[1,],type="l",lwd=5)
lines(get("alpha",env.concurrent),lty=2,lwd=2,col=2)

# estimate of gamma
plot(fit$Y$curve[1,],type="l",lwd=5)
lines(get("gamma",env.concurrent),lty=2,lwd=2,col=2)

# estimate of beta
plot(fit$Y$curve[2,],type="l",lwd=5)
lines(get("beta",env.concurrent),lty=2,lwd=2,col=2)

# estimate of causal curves
plot(fit$IE$curve,type="l",lwd=5)
plot(fit$DE$curve,type="l",lwd=5)
##################################################



