library(landscapeR)


### Name: makeLine
### Title: Create a linear patch (beta version).
### Aliases: makeLine

### ** Examples

library(raster)
r <- matrix(0,33,33)
r <- raster(r, xmn=0, xmx=10, ymn=0, ymx=10)
plot(makeLine(r, size=50, spt = 545, direction=45, convol=0.05, rast=TRUE))




