library(SOPIE)


### Name: b.estimate
### Title: Estimate the Right Endpoint of the Off-Pulse Interval of a
###   Pulsar
### Aliases: b.estimate
### Keywords: nonparametric

### ** Examples

## This function is to be used inside the wrapper function SOPIE

simdata<-von_mises_sim(n=5000,k=1,c=0.3,noise=0.2)
SOPIE(simdata,h=1,to=1,alpha=0.05,g=5,r=10,m=1,grid=100)



