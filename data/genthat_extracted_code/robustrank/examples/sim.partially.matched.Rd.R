library(robustrank)


### Name: sim.partially.matched
### Title: Simulate Paired, Independent, or Partially Matched Two-Sample
###   Data
### Aliases: r2sample sim.paired.with.replicates sim.partially.matched

### ** Examples


dat=sim.partially.matched(m=10,n.x=5,n.y=4,distr="normal",
    params=c("loc.2"=0,"rho"=0,"scale.2"=1),seed=1)
X=dat$X; Y=dat$Y; Yprime=dat$Yprime    

#dat=sim.partially.matched(m=10,n.x=5,n.y=4,distr="logistic",
#    params=c("loc.2"=0,"rho"=0,"scale.2"=1),seed=1)
#X=dat$X; Y=dat$Y; Yprime=dat$Yprime    





