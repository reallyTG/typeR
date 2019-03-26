library(CensSpatial)


### Name: derivQfun
### Title: Maximum Likelihood Expectation (logQ function and its derivates)
### Aliases: derivQfun
### Keywords: Spatial Censored SAEM

### ** Examples

## Not run: 
##D require(geoR)
##D 
##D data("Missouri")
##D data=Missouri
##D data$V3=log((data$V3))
##D 
##D 
##D 
##D cc=data$V5
##D y=data$V3
##D n=127
##D datare1=data
##D coords=datare1[,1:2]
##D data1=data.frame(coords,y)
##D data1=data1[cc==0,]
##D geodata=as.geodata(data1,y.col=3,coords.col=1:2)
##D v=variog(geodata)
##D v1=variofit(v)
##D cov.ini=c(0,2)
##D 
##D est=SAEMSCL(cc,y,cens.type="left",trend="cte",coords=coords,M=15,perc=0.25,MaxIter=5,pc=0.2,
##D cov.model="exponential",fix.nugget=T,nugget=2,inits.sigmae=cov.ini[2],inits.phi=cov.ini[1],
##D search=T,lower=0.00001,upper=50)
##D 
##D 
##D d1=derivQfun(est)
##D d1$QI
## End(Not run)




