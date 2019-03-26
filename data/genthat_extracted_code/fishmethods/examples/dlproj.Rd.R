library(fishmethods)


### Name: dlproj
### Title: This function performs projections for dbsra and catchmsy
###   objects
### Aliases: dlproj
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D   data(lingcod)
##D    outs<-catchmsy(year=lingcod$year,
##D     catch=lingcod$catch,catchCV=NULL,
##D     catargs=list(dist="none",low=0,up=Inf,unit="MT"),
##D     l0=list(low=0.8,up=0.8,step=0),
##D     lt=list(low=0.01,up=0.25,refyr=2002),sigv=0,
##D     k=list(dist="unif",low=4333,up=433300,mean=0,sd=0),
##D     r=list(dist="unif",low=0.015,up=0.5,mean=0,sd=0),
##D     bk=list(dist="unif",low=0.5,up=0.5,mean=0,sd=0),
##D     M=list(dist="unif",low=0.24,up=0.24,mean=0.00,sd=0.00),
##D     nsims=30000)
##D    outbio<-dlproj(dlobj = outs, projyears = 20, projtype = 0, grout = 1)
##D  
## End(Not run)



