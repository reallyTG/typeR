library(CensSpatial)


### Name: predgraphics
### Title: Prediction graphics for SAEM Algortihm for censored spatial
###   data.
### Aliases: predgraphics
### Keywords: Spatial Censored SAEM

### ** Examples

## Not run: 
##D data(depth)
##D cc=depth$cc
##D y=depth$depth
##D coords=depth[,1:2]
##D 
##D cov.ini=c(1500,30)
##D est=SAEMSCL(cc,y,cens.type="left",trend="cte",coords=coords,M=15,perc=0.25,
##D MaxIter=100,pc=0.2,cov.model="gaussian",fix.nugget=F,nugget=10,
##D inits.sigmae=cov.ini[2],inits.phi=cov.ini[1], search=T,lower=c(0.00001,0.00001),
##D upper=c(10000,100))
##D 
##D 
##D coorgra1=seq(min(coords[,1]),max(coords[,1]),length=50)
##D coorgra2=seq(min(coords[,2]),max(coords[,2]),length=50)
##D 
##D grid1=expand.grid(x=coorgra1,y=coorgra2)
##D xpred=rep(1,2500)
##D 
##D predgraphics(xpred=xpred,est=est,grid1=grid1,points=T,sdgraph=T)
##D 
## End(Not run)



