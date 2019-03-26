library(SOPIE)


### Name: SOPIE
### Title: Sequential Off-Pulse Interval Estimation of a Pulsar Light Curve
### Aliases: SOPIE
### Keywords: nonparametric

### ** Examples

set.seed(777)
simdata<-von_mises_sim(n=5000,k=1,c=0.3,noise=0.2)
SOPIE(simdata,h=1,to=1,alpha=0.05,g=5,r=10,m=1,grid=100)
data(crab)
SOPIE(crab)
data(J1709)
SOPIE(J1709)



