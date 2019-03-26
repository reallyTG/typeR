library(CensSpatial)


### Name: predSCL
### Title: Prediction for the SAEM algorithm for censored spatial data.
### Aliases: predSCL
### Keywords: Spatial Censored SAEM

### ** Examples


## Not run: 
##D 
##D 
##D n<-200 ### sample size for estimation.
##D n1=100 ### number of observation used in the prediction.
##D 
##D ###simulated coordinates
##D r1=sample(seq(1,30,length=400),n+n1)
##D r2=sample(seq(1,30,length=400),n+n1)
##D 
##D coords=cbind(r1,r2)### coordinates for estimation and prediction.
##D 
##D coords1=coords[1:n,]####coordinates used in estimation.
##D 
##D cov.ini=c(0.2,0.1)###initial values for phi and sigma2.
##D 
##D type="matern"
##D xtot<-cbind(1,runif((n+n1)),runif((n+n1),2,3))###X matrix for estimation and prediction.
##D 
##D xobs=xtot[1:n,]###X matrix for estimation.
##D beta=c(5,3,1)
##D 
##D ###simulated data
##D obj=rspacens(cov.pars=c(3,.3,0),beta=beta,x=xtot,coords=coords,kappa=1.2,cens=0.25,
##D n=(n+n1),n1=n1,cov.model=type,cens.type="left")
##D 
##D data2=obj$datare
##D cc=obj$cc
##D y=obj$datare[,3]
##D coords=obj$datare[,1:2]
##D 
##D 
##D #######SAEMSpatialCens object########
##D 
##D est=SAEMSCL(cc,y,cens.type="left",trend="other",x=xobs,coords=coords,kappa=1.2,M=15,
##D perc=0.25,MaxIter=10,pc=0.2,cov.model="exponential",fix.nugget=TRUE,nugget=0,
##D inits.sigmae=cov.ini[2],inits.phi=cov.ini[1],search=TRUE,lower=0.00001,upper=50)
##D 
##D 
##D coordspred=obj$coords1
##D xpred=xtot[(n+1):(n+n1),]
##D h=predSCL(xpred,coordspred,est)
## End(Not run)




