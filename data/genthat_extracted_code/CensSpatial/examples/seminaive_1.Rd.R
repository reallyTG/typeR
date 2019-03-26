library(CensSpatial)


### Name: Seminaive
### Title: Seminaive algorithm for spatial censored prediction.
### Aliases: Seminaive
### Keywords: Spatial Censored SAEM

### ** Examples


## Not run: 
##D 
##D n<-200 ### sample size for estimation.
##D n1=100 ### number of observation used in the prediction.
##D 
##D ###simulated coordinates.
##D r1=sample(seq(1,30,length=400),n+n1)
##D r2=sample(seq(1,30,length=400),n+n1)
##D coords=cbind(r1,r2)### total coordinates (used in estimation and prediction).
##D coords1=coords[1:n,]####coordinates used for estimation.
##D 
##D type="matern"### covariance structure.
##D 
##D xtot<-cbind(1,runif((n+n1)),runif((n+n1),2,3))## X matrix for estimation and prediction.
##D xobs=xtot[1:n,]## X matrix for estimation.
##D 
##D ###simulated data.
##D obj=rspacens(cov.pars=c(3,.3,0),beta=c(5,3,1),x=xtot,coords=coords,kappa=1.2,
##D cens=0.25,n=(n+n1),n1=n1,cov.model=type,cens.type="left")
##D 
##D data2=obj$datare
##D data2[,4:5]=xobs[,-1]
##D 
##D cc=obj$cc
##D y=obj$datare[,3]
##D ###seminaive algorithm
##D r=Seminaive(data=data2,y.col=3,covar=T,coords.col=1:2,covar.col=4:5,cov.model="matern",
##D thetaini=c(.1,.2),fix.nugget=T,nugget=0,kappa=1.5,cons=c(0.1,2,0.5),MaxIter=100,
##D cc=obj$cc,copred=obj$coords1,trend=~V4+V5)
##D 
## End(Not run)



