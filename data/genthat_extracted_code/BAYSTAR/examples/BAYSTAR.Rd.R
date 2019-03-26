library(BAYSTAR)


### Name: BAYSTAR
### Title: Threshold Autoregressive model: Bayesian approach
### Aliases: BAYSTAR
### Keywords: methods

### ** Examples


set.seed(989981)
## Set the true values of all parameters
nob<- 200                ## No. of observations
lagd<- 1                  ## delay lag of threshold variable
r<- 0.4                   ## r is the threshold value
sig.1<- 0.8; sig.2<- 0.5  ## variances of error distributions for two regimes
p1<- 2; p2<- 1            ## No. of covariate in two regimes
ph.1<- c(0.1,-0.4,0.3)    ## mean coefficients for regime 1
ph.2<- c(0.2,0.6)     ## mean coefficients for regime 2
lagp1<-1:2
lagp2<-1:1

yt<- TAR.simu(nob,p1,p2,ph.1,ph.2,sig.1,sig.2,lagd,r,lagp1,lagp2)


## Total MCMC iterations and burn-in iterations
Iteration <- 500
Burnin    <- 200


## A RW (random walk) MH algorithm is used in simulating the threshold value
## Step size for the RW MH
step.thv<- 0.08

out <- BAYSTAR(yt,lagp1,lagp2,Iteration,Burnin,constant=1,step.thv=step.thv,tplot=TRUE)



