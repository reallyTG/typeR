library(cfma)


### Name: FMA.historical.boot
### Title: Functional mediation analysis under historical influence
###   regression model with point-wise bootstrap confidence interval
### Aliases: FMA.historical.boot
### Keywords: models

### ** Examples


##################################################
# Historical influence functional mediation model
data(env.historical)
Z<-get("Z",env.historical)
M<-get("M",env.historical)
Y<-get("Y",env.historical)

## No test: 
# consider Fourier basis
fit.boot<-FMA.historical.boot(Z,M,Y,delta.grid1=3,delta.grid2=3,delta.grid3=3,
    intercept=FALSE,timeinv=c(0,300))
## End(No test)
##################################################



