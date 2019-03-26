library(Rvcg)


### Name: vcgSample
### Title: Subsamples points on a mesh surface
### Aliases: vcgSample

### ** Examples


data(humface)
ss <- vcgSample(humface,SampleNum = 500, type="km",threads=1)
## Not run: 
##D require(rgl)
##D points3d(ss)
## End(Not run)



