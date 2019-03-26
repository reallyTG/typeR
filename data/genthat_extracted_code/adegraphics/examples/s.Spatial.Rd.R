library(adegraphics)


### Name: s.Spatial
### Title: Mapping of a Spatial* object
### Aliases: s.Spatial
### Keywords: hplot

### ** Examples

data(elec88, package = "ade4")
## mapping whithout data
g1 <- s.Spatial(elec88$Spatial)

## Not run: 
##D   if(require(sp, quietly = TRUE)) {
##D     ## mapping whith data
##D     obj <- SpatialPolygonsDataFrame(Sr = elec88$Spatial, data = elec88$tab)
##D     g2 <- s.Spatial(obj)
##D     g3 <- s.Spatial(obj, nclass = 2, col = c("red", "blue"))
##D   }
## End(Not run)



