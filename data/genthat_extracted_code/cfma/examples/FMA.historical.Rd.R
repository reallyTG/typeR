library(cfma)


### Name: FMA.historical
### Title: Functional mediation analysis under historical influence model
### Aliases: FMA.historical
### Keywords: models

### ** Examples


##################################################
# Historical influence functional mediation model
data(env.historical)
Z<-get("Z",env.historical)
M<-get("M",env.historical)
Y<-get("Y",env.historical)

# consider Fourier basis
fit<-FMA.historical(Z,M,Y,delta.grid1=3,delta.grid2=3,delta.grid3=3,
    intercept=FALSE,timeinv=c(0,300))

# estimate of causal curves
plot(fit$IE$curve,type="l",lwd=5)
plot(fit$DE$curve,type="l",lwd=5)
##################################################



