library(BAYSTAR)


### Name: TAR.simu
### Title: Simulated data from TAR model
### Aliases: TAR.simu
### Keywords: methods

### ** Examples

## Set the true values of all parameters
nob<- 2000                ## No. of observations
lagd<- 1                  ## delay lag of threshold variable
r<- 0.4                   ## r is the threshold value
sig.1<- 0.8; sig.2<- 0.5  ## variances of error distributions for two regimes
p1<- 2; p2<- 2            ## No. of covariate in two regimes
ph.1<- c(0.1,-0.4,0.3)    ## mean coefficients for regime 1
ph.2<- c(0.2,0.3,0.3)     ## mean coefficients for regime 2
lagp1<-1:2
lagp2<-1:2

yt<- TAR.simu(nob,p1,p2,ph.1,ph.2,sig.1,sig.2,lagd,r,lagp1,lagp2)



