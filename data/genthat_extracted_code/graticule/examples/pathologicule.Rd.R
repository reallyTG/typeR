library(graticule)


### Name: pathologicule
### Title: Create a mesh of evenly spaced lines in another projection.
### Aliases: pathologicule

### ** Examples

## Not run: 
##D library(maptools)
##D data(wrld_simpl)
##D library(raster)
##D w <- subset(wrld_simpl, NAME == "Australia")
##D plot(w)
##D laea <- pathologicule(w, "+proj=laea +lon_0=147 +lat_0=-42 +ellps=WGS84")
##D stere <- pathologicule(w, "+proj=stere +lon_0=147 +lat_0=-42 +ellps=WGS84")
##D plot(laea, add = TRUE, col = "dodgerblue")
##D plot(stere, add = TRUE, col = "firebrick")
##D pst90 <- "+proj=stere +lat_0=-90 +ellps=WGS84"
##D p <- spTransform(subset(wrld_simpl, coordinates(wrld_simpl)[,2] < -20), pst90)
##D plot(extent(p) + 1e6, asp = 1, type = "n"); plot(p, add = TRUE)
##D laea <- pathologicule(p, "+proj=laea +lon_0=147 +lat_0=-72 +ellps=WGS84")
##D stere <- pathologicule(p, "+proj=stere +lon_0=147 +lat_0=-42 +ellps=WGS84")
##D plot(laea, add = TRUE, col = "dodgerblue")
##D plot(stere, add = TRUE, col = "firebrick")
## End(Not run)



