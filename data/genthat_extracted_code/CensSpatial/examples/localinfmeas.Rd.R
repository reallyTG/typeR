library(CensSpatial)


### Name: localinfmeas
### Title: Local influence measures.
### Aliases: localinfmeas
### Keywords: Spatial Censored SAEM

### ** Examples

## Not run: 
##D require(geoR)
##D 
##D data("Missouri")
##D data=Missouri
##D data$V3=log((data$V3))
##D cc=data$V5
##D y=data$V3
##D n=127
##D k=1
##D datare1=data
##D coords=datare1[,1:2]
##D data1=data.frame(coords,y)
##D data1=data1[cc==0,]
##D geodata=as.geodata(data1,y.col=3,coords.col=1:2)
##D v=variog(geodata)
##D v1=variofit(v)
##D cov.ini=c(0,2)
##D est=SAEMSCL(cc,y,cens.type="left",trend="cte",coords=coords,M=15,perc=0.25,
##D MaxIter=5,pc=0.2,cov.model="exponential",fix.nugget=T,nugget=2,
##D inits.sigmae=cov.ini[2],inits.phi=cov.ini[1], search=T,lower=0.00001,upper=100)
##D 
##D 
##D w=localinfmeas(est,fix.nugget=T,c=3)
##D 
##D res=w$respper
##D res[res[,1]=="atypical obs",]
##D 
##D sm=w$smper
##D sm[sm[,1]=="atypical obs",]
##D 
##D ev=w$expvper
##D ev[ev[,1]=="atypical obs",]
##D 
##D 
##D ##############ANOTHER EXAMPLE#########
##D 
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
##D est=SAEMSCL(cc,y,cens.type="left",trend="cte",coords=coords,M=15,perc=0.25,
##D MaxIter=10,pc=0.2,cov.model=type,fix.nugget=T,nugget=0,inits.sigmae=cov.ini[1],
##D inits.phi=cov.ini[2],search=T,lower=0.00001,upper=50)
##D 
##D 
##D w=localinfmeas(est,fix.nugget=T,c=3)
##D 
##D res=w$respper
##D res[res[,1]=="atypical obs",]
##D 
##D sm=w$smper
##D sm[sm[,1]=="atypical obs",]
##D 
##D ev=w$expvper
##D ev[ev[,1]=="atypical obs",]
##D 
## End(Not run)



