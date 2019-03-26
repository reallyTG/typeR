library(raster)


### Name: subset
### Title: Subset layers in a Raster* object
### Aliases: subset subset,Raster-method subset,RasterStack-method
### Keywords: spatial

### ** Examples

s <- stack(system.file("external/rlogo.grd", package="raster"))
sel <- subset(s, 2:3)

# Note that this is equivalent to
sel2 <- s[[2:3]]


# and in this particular case:
sel3 <- dropLayer(s, 1)

nlayers(s)
nlayers(sel)

# effect of 'drop=FALSE' when selecting a single layer
sel <- subset(s, 2)
class(sel)
sel <- subset(s, 2, drop=FALSE)
class(sel)



