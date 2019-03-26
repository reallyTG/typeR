library(RSAGA)


### Name: focal.function
### Title: Local and Focal Grid Functions
### Aliases: focal.function gapply local.function
### Keywords: spatial

### ** Examples

## Not run: 
##D # A simple median filter applied to dem.asc:
##D gapply("dem","median",radius=3)
##D # Same:
##D #focal.function("dem",fun="median",radius=3,mw.to.vector=TRUE,mw.na.rm=TRUE)
##D # See how the filter has changed the elevation data:
##D d1 = as.vector(read.ascii.grid("dem")$data)
##D d2 = as.vector(read.ascii.grid("median")$data)
##D hist(d1-d2,br=50)
## End(Not run)
# Wind shelter index used by Plattner et al. (2004):
## Not run: 
##D ctrl = wind.shelter.prep(6,-pi/4,pi/12,10)
##D focal.function("dem",fun=wind.shelter,control=ctrl,
##D     radius=6,search.mode="circle")
## End(Not run)
# Or how about this, if "aspect" is local terrain exposure:
## Not run: 
##D gapply("aspect","cos") # how "northerly-exposed" is a pixel?
##D gapply("aspect","sin") # how "easterly-exposed" is a pixel?
##D # Same result, but faster:
##D focal.function("aspect",fun=function(x) c(cos(x),sin(x)), varnames=c("cos","sin"))
## End(Not run)



