library(geospt)


### Name: samplePts
### Title: sample _n_ point locations in (or on) a spatial object
### Aliases: samplePts
### Keywords: spatial

### ** Examples

data(lalib)
hexPts <- samplePts(lalib, 5, "hexagonal")
plot(lalib, xlim=c(bbox(lalib)[1], bbox(lalib)[3]), ylim=c(bbox(lalib)[2],
    bbox(lalib)[4]))
plot(hexPts, add=TRUE)
## Not run: 
##D randomPts <- samplePts(lalib, 5, "random")
##D plot(lalib, xlim=c(bbox(lalib)[1], bbox(lalib)[3]), ylim=c(bbox(lalib)[2],
##D     bbox(lalib)[4]))
##D plot(randomPts, add=TRUE)
## End(Not run)



