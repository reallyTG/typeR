library(SOPIE)


### Name: von_mises_sim
### Title: Generates Simulated Data from a Von Mises Distribution with
###   Noise
### Aliases: von_mises_sim
### Keywords: nonparametric

### ** Examples

set.seed(777)
simdata<-von_mises_sim(n=5000,k=1,c=0.3,noise=0.2)
hist(simdata)
SOPIE(simdata,h=1,to=1,alpha=0.05,g=5,r=10,m=1,grid=100)



