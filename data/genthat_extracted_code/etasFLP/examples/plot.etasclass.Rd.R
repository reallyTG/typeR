library(etasFLP)


### Name: plot.etasclass
### Title: Plot method for etasclass objects
### Aliases: plot.etasclass
### Keywords: ETAS plot earthquake

### ** Examples

## Not run: 
##D data("italycatalog")
##D # load a sample catalog of the italian seismicity
##D 
##D class(italycatalog)<-"eqcat"
##D 
##D etas.flp<-etasclass(italycatalog,description="etas flp",magn.threshold=3.1,thinning=FALSE,flp=TRUE,
##D is.backconstant=FALSE,magn.threshold.back=3.5,sectoday=TRUE,
##D onlytime=FALSE,declustering=TRUE,epsmax=0.00001,
##D params.ind=c(1,1,1,1,1,1,1,1),k0=0.005,c=0.005,p=1.01,a=1.05,gamma=0.6,q=1.52,d=1.1,
##D compsqm=TRUE,usenlm=TRUE,ndeclust=15)
##D 
##D # execution of etasclass for events with minimum magnitude of 3.1. 
##D # The events with magnitude at least 3.5 are used to build a first approximation
##D # for the background intensity function
##D # (magn.threshold.back=3.5)
##D 
##D 
##D # plot method
##D 
##D plot(etas.flp)
##D 
## End(Not run)



