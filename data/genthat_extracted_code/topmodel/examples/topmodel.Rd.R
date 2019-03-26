library(topmodel)


### Name: topmodel
### Title: implementation of the hydrological model TOPMODEL
### Aliases: topmodel
### Keywords: models

### ** Examples

data(huagrahuma)
attach(huagrahuma)

## returns the simulated runoff (Qobs not given)
Qsim <- topmodel(parameters, topidx, delay, rain, ETp)

## returns a list of simulated runoff (Q), overland flow (qo), subsurface flow (qs) and storage (S):
Qsim <- topmodel(parameters, topidx, delay, rain,ETp, verbose = TRUE)

## plot observed and simulated discharge:
plot(Qobs)
points(Qsim$Q, col="red", type="l")

## For a Monte carlo sampling from a uniform distribution, we construct a parameter matrix:

runs<-10

qs0   <- runif(runs, min=0, max=4e-5)
lnTe  <- runif(runs, min=-2, max=1)
m     <- runif(runs, min=0, max=0.2)
Sr0   <- runif(runs, min=0, max=0.02)
Srmax <- runif(runs, min=0, max=2)
td    <- runif(runs, min=0, max=3)
vch   <- 1000
vr    <- runif(runs, min=100, max=2500)
k0    <- runif(runs, min=0, max=0.01)
CD    <- runif(runs, min=0, max=5)
dt    <- 0.25

parameters<-cbind(qs0,lnTe,m,Sr0,Srmax,td,vch,vr,k0,CD,dt)

## returns an array of 10 Nash Sutcliffe efficiencies; one for each parameter set:
result<-topmodel(parameters, topidx, delay, rain, ETp, Qobs = Qobs)




