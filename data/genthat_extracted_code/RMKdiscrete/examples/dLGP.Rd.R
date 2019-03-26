library(RMKdiscrete)


### Name: LGP
### Title: The (univariate) Lagrangian Poisson (LGP) Distribution
### Aliases: LGP LGPMVP LGP.findmax LGP.get.nc dLGP pLGP qLGP rLGP sLGP

### ** Examples

LGP.findmax(theta=2, lambda=0.2) #<--No upper support limit
LGP.findmax(theta=2, lambda=-0.2) #<--Upper support limit of 9
LGP.get.nc(theta=2, lambda=0.2)-1==0 #<--TRUE
LGP.get.nc(theta=2, lambda=-0.2)-1 #<--nc differs appreciably from 1
LGP.get.nc(theta=2, lambda=-0.1)-1 #<--nc doesn't differ appreciably from 1
LGPMVP(theta=2, lambda=0.9)
LGPMVP(mu=20, sigma2=2000)
sLGP(theta=2, lambda=0.9)
dLGP(x=0:10,theta=1,lambda=0.1)
dLGP(x=0:10,theta=1,lambda=0)
dLGP(x=0:10,theta=1,lambda=-0.1) #<--Upper support limit of 9
pLGP(q=0:10,theta=1,lambda=0.1)
pLGP(q=0:10,theta=1,lambda=0)
pLGP(q=0:10,theta=1,lambda=-0.1) 
qLGP(p=(0:9)/10,theta=1,lambda=0.1)
qLGP(p=(0:9)/10,theta=1,lambda=0)
qLGP(p=(0:9)/10,theta=1,lambda=-0.1) 
rLGP(n=5,theta=1e12,lambda=-0.0001)



