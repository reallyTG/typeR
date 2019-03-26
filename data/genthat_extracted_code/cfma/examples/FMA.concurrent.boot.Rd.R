library(cfma)


### Name: FMA.concurrent.boot
### Title: Functional mediation analysis under concurrent regression model
###   with point-wise bootstrap confidence interval
### Aliases: FMA.concurrent.boot
### Keywords: models

### ** Examples


##################################################
# Concurrent functional mediation model
data(env.concurrent)
Z<-get("Z",env.concurrent)
M<-get("M",env.concurrent)
Y<-get("Y",env.concurrent)

## No test: 
# consider Fourier basis
fit.boot<-FMA.concurrent.boot(Z,M,Y,intercept=FALSE,timeinv=c(0,300))
## End(No test)
##################################################



