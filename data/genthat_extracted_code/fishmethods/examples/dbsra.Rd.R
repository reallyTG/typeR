library(fishmethods)


### Name: dbsra
### Title: Depletion-Based Stock Reduction Analysis
### Aliases: dbsra
### Keywords: misc

### ** Examples

 ## Not run: 
##D   data(cowcod)
##D   dbsra(year =cowcod$year, catch = cowcod$catch, catchCV = NULL, 
##D     catargs = list(dist="none",low=0,up=Inf,unit="MT"),
##D     agemat=11, k = list(low=100,up=15000,tol=0.01,permax=1000), 
##D     b1k = list(dist="none",low=0.01,up=0.99,mean=1,sd=0.1),
##D     btk = list(dist="beta",low=0.01,up=0.99,mean=0.1,sd=0.1,refyr=2009),
##D     fmsym = list(dist="lnorm",low=0.1,up=2,mean=-0.223,sd=0.2),
##D     bmsyk = list(dist="beta",low=0.05,up=0.95,mean=0.4,sd=0.05),
##D     M = list(dist="lnorm",low=0.001,up=1,mean=-2.90,sd=0.4),
##D     nsims = 10000)
##D  
## End(Not run)



