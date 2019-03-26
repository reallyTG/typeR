library(CensSpatial)


### Name: atypical
### Title: Detection for local influence
### Aliases: atypical
### Keywords: Spatial Censored SAEM

### ** Examples

## Not run: 
##D n<-200 ### sample size for estimation
##D n1=100 ### number of observation used in the prediction
##D 
##D ###simulated coordinates
##D r1=sample(seq(1,30,length=400),n+n1)
##D r2=sample(seq(1,30,length=400),n+n1)
##D coords=cbind(r1,r2)
##D 
##D coords1=coords[1:n,]
##D 
##D cov.ini=c(0.2,0.1)
##D type="exponential"
##D xtot=as.matrix(rep(1,(n+n1)))
##D xobs=xtot[1:n,]
##D beta=5
##D 
##D ###simulated data
##D obj=rspacens(cov.pars=c(3,.3,0),beta=beta,x=xtot,coords=coords,cens=0.25,n=(n+n1),
##D n1=n1,cov.model=type,cens.type="left")
##D 
##D data2=obj$datare
##D cc=obj$cc
##D y=obj$datare[,3]
##D 
##D ##### generating atypical observations###
##D y[91]=y[91]+4
##D y[126]=y[126]+4
##D y[162]=y[162]+4
##D coords=obj$datare[,1:2]
##D 
##D ###initial values###
##D cov.ini=c(0.2,0.1)
##D 
##D est=SAEMSCL(cc,y,cens.type="left",trend="cte",coords=coords,
##D M=15,perc=0.25,MaxIter=10,pc=0.2,cov.model=type,
##D fix.nugget=T,nugget=0,inits.sigmae=cov.ini[1],
##D inits.phi=cov.ini[2],search=T,lower=0.00001,upper=50)
##D 
##D 
##D w=localinfmeas(est,fix.nugget=T,c=3) ## object of class localinfmeas
##D 
##D atypical(w)
## End(Not run)



