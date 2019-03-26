library(CensSpatial)


### Name: SAEMSCL
### Title: SAEM Algorithm estimation for censored spatial data.
### Aliases: SAEMSCL
### Keywords: Spatial Censored SAEM

### ** Examples


## Not run: 
##D n<-200 ### sample size for estimation.
##D n1=100 ### number of observation used in the prediction.
##D 
##D ###simulated coordinates
##D r1=sample(seq(1,30,length=400),n+n1)
##D r2=sample(seq(1,30,length=400),n+n1)
##D coords=cbind(r1,r2)
##D 
##D coords1=coords[1:n,]
##D 
##D type="matern"
##D #xtot<-cbind(1,runif((n+n1)),runif((n+n1),2,3))
##D xtot=as.matrix(rep(1,(n+n1)))
##D xobs=xtot[1:n,]
##D beta=5
##D #beta=c(5,3,1)
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
##D 
##D #####obtaining initial values and a possibly search interval.
##D require(geoR)
##D geod=as.geodata(data2[cc==0,],coords.col=1:2,y.col=3)
##D p=variog(geod)
##D init=variofit(p,ini.cov.pars=c(0.5,0.2))
##D 
##D 
##D ##initials values obtained from variofit.
##D cov.ini=c(0.13,0.86)
##D 
##D ##########with the argument search=F (not converge!! error) ########
##D 
##D 
##D est=SAEMSCL(cc,y,cens.type="left",trend="cte",coords=coords,kappa=1.2,M=15,perc=0.25,
##D MaxIter=10,pc=0.2,cov.model="exponential",fix.nugget=T,nugget=0,inits.sigmae=cov.ini[1],
##D inits.phi=cov.ini[2],search=F)
##D 
##D 
##D 
##D #######with the argument search=T and considering lower=0.00001, upper=100.
##D #(a relatively wide interval considering the initial values).
##D 
##D est=SAEMSCL(cc,y,cens.type="left",trend="cte",coords=coords,kappa=1.2,M=15,perc=0.25,
##D MaxIter=10,pc=0.2,cov.model=type,fix.nugget=T,nugget=0,inits.sigmae=cov.ini[1],
##D inits.phi=cov.ini[2],search=T,lower=0.00001,upper=100)
##D 
##D 
##D ########considering cens.type="both" but equivalent to "left".
##D 
##D LI=rep(-Inf,length(y))
##D LS=rep(Inf,length(y))
##D LS[cc==1]=obj$cutof
##D 
##D 
##D est=SAEMSCL(cc,y,cens.type="both",LI=LI,LS=LS,trend="cte",coords=coords,kappa=1.2,M=15,
##D perc=0.25,MaxIter=10,pc=0.2,cov.model="exponential",fix.nugget=T,nugget=0,
##D inits.sigmae=cov.ini[1],inits.phi=cov.ini[2],search=T,lower=0.00001,upper=100)
##D 
## End(Not run)




