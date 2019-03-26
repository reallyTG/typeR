library(EGRET)


### Name: estSurfaces
### Title: Estimate the three surfaces (for yHat, SE and ConcHat) as a
###   function of DecYear and logQ and store in the three-dimensional
###   object called surfaces
### Aliases: estSurfaces
### Keywords: statistics water-quality

### ** Examples

eList <- Choptank_eList
## Not run: 
##D surfaces <- estSurfaces(eList)
##D 
##D surfaceStart <- "1984-10-01"
##D surfaceEnd <- "1986-09-30"
##D surfaces_1 <- estSurfaces(eList, surfaceStart, surfaceEnd)
##D 
##D wall_sample <- head(eList$Sample, n=500)
##D 
##D surface_wall <- estSurfaces(eList, localSample = wall_sample)
##D 
## End(Not run)



