library(adegraphics)


### Name: adeg.panel.Spatial
### Title: Panel function for adding spatial objects.
### Aliases: adeg.panel.Spatial
### Keywords: aplot

### ** Examples


if(require(lattice, quietly = TRUE) & require(sp, quietly = TRUE)) {
data(elec88, package = "ade4")

xy <- elec88$xy
arrow <- list("SpatialPolygonsRescale", offset = c(150000,1700000),
layout.north.arrow(), scale = 100000)

xyplot(xy[, 2] ~ xy[, 1], aspect = "iso", panel = function(...){
  adeg.panel.Spatial(SpObject = elec88$Spatial, sp.layout = list(arrow), 
  col = colorRampPalette(c("yellow", "blue"))(5), border =
  "transparent")})
}



