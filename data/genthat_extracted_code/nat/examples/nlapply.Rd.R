library(nat)


### Name: nlapply
### Title: lapply and mapply for neuronlists (with optional
###   parallelisation)
### Aliases: nlapply nmapply

### ** Examples

## nlapply example
kcs.reduced=nlapply(kcs20,function(x) subset(x,sample(nrow(x$points),50)))
open3d()
plot3d(kcs.reduced,col='red', lwd=2)
plot3d(kcs20,col='grey')
rgl.close()

## Not run: 
##D # example of using plyr's .inform argument for debugging error conditions
##D xx=nlapply(Cell07PNs, prune_strahler)
##D # oh dear there was an error, let's get some details about the neuron
##D # that caused the problem
##D xx=nlapply(Cell07PNs, prune_strahler, .inform=TRUE)
## End(Not run)

## Not run: 
##D ## nlapply example with plyr
##D ## dotprops.neuronlist uses nlapply under the hood
##D ## the .progress and .parallel arguments are passed straight to 
##D system.time(d1<-dotprops(kcs20,resample=1,k=5,.progress='text'))
##D ## plyr+parallel
##D library(doMC)
##D # can also specify cores e.g. registerDoMC(cores=4)
##D registerDoMC()
##D system.time(d2<-dotprops(kcs20,resample=1,k=5,.parallel=TRUE))
##D stopifnot(all.equal(d1,d2))
## End(Not run)

## nmapply example
# flip first neuron in X, second in Y and 3rd in Z
xyzflip=nmapply(mirror, kcs20[1:3], mirrorAxis = c("X","Y","Z"),
 mirrorAxisSize=c(400,20,30))
## No test: 
open3d()
plot3d(kcs20[1:3])
plot3d(xyzflip)
rgl.close()
## End(No test)

## Not run: 
##D ## Override default progress bar behaviour via options
##D sl=nlapply(Cell07PNs, FUN = seglengths)
##D options(nat.progress='none')
##D sl=nlapply(Cell07PNs, FUN = seglengths)
##D options(nat.progress=NULL)
##D sl=nlapply(Cell07PNs, FUN = seglengths)
## End(Not run)



