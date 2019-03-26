library(etasFLP)


### Name: bwd.nrd
### Title: Silverman's rule optimal for the estimation of a kernel
###   bandwidth
### Aliases: bwd.nrd
### Keywords: bandwidth kernel

### ** Examples

## Not run: 
##D ## The function is currently defined as
##D function (x,w=replicate(length(x),1),d=2) 
##D {
##D     if (length(x) < 2L) 
##D         stop("need at least 2 data points")
##D      m<-weighted.mean(x,w) 
##D      return(sqrt(weighted.mean((x-m)^2,w)) * 
##D 	      (length(x)*(d+2)/4)^(-1/(d+4)))
##D }
## End(Not run)



