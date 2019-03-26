library(CensSpatial)


### Name: rspacens
### Title: Censored Spatial data simulation
### Aliases: rspacens
### Keywords: Spatial Censored SAEM

### ** Examples


n<-200 ### sample size for estimation.
n1=100 ### number of observation used in the prediction.

###simulated coordinates
r1=sample(seq(1,30,length=400),n+n1)
r2=sample(seq(1,30,length=400),n+n1)
coords=cbind(r1,r2)### total coordinates (used in estimation and prediction).
coords1=coords[1:n,]####coordinates used for estimation.

type="matern"### covariance structure.

xtot<-cbind(1,runif((n+n1)),runif((n+n1),2,3))## X matrix for estimation and prediction.
xobs=xtot[1:n,]## X matrix for estimation

obj=rspacens(cov.pars=c(3,.3,0),beta=c(5,3,1),x=xtot,coords=coords,
kappa=1.2,cens=0.25,n=(n+n1),n1=n1,cov.model=type,cens.type="left")




