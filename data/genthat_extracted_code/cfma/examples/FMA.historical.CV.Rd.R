library(cfma)


### Name: FMA.historical.CV
### Title: Functional mediation analysis under historical influence model
### Aliases: FMA.historical.CV
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
fit<-FMA.historical.CV(Z,M,Y,delta.grid1=3,delta.grid2=3,delta.grid3=3,
    intercept=FALSE,timeinv=c(0,300))
## End(No test)
##################################################



