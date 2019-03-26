library(fishmethods)


### Name: catchmsy
### Title: Estimating MSY from catch and resilience
### Aliases: catchmsy
### Keywords: misc

### ** Examples

  ## Not run: 
##D    data(lingcod)
##D    outpt<-catchmsy(year=lingcod$year,
##D      catch=lingcod$catch,catchCV=NULL,
##D      catargs=list(dist="none",low=0,up=Inf,unit="MT"),
##D     l0=list(low=0.8,up=0.8,step=0),
##D     lt=list(low=0.01,up=0.25,refyr=2002),sigv=0,
##D     k=list(dist="unif",low=4333,up=433300,mean=0,sd=0),
##D     r=list(dist="unif",low=0.015,up=0.1,mean=0,sd=0),
##D     M=list(dist="unif",low=0.18,up=0.18,mean=0.00,sd=0.00),
##D     nsims=30000)
##D  
## End(Not run)



