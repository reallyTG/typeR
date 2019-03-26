library(fishmethods)


### Name: grotag
### Title: Maximum likelihood estimation of growth and growth variability
###   from tagging data - Francis (1988)
### Aliases: grotag
### Keywords: misc

### ** Examples

data(bonito)

#Model 4 of Francis (1988)
with(bonito,
 grotag(L1=L1, L2=L2, T1=T1, T2=T2,alpha=35,beta=55,
 	design=list(nu=1,m=1,p=1,sea=1),
 	stvalue=list(sigma=0.9,nu=0.4,m=-1,p=0,u=0.4,w=0.4),
 	upper=list(sigma=5,nu=1,m=2,p=0.5,u=1,w=1),
 	lower=list(sigma=0,nu=0,m=-2,p=0,u=0,w=0),control=list(maxit=1e4)))



