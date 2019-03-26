library(adehabitatMA)


### Name: mimage
### Title: Displaying Multi-layer Raster Maps
### Aliases: mimage
### Keywords: spatial

### ** Examples


data(lynxjura)

lynxjura$map

mimage(lynxjura$map)

mimage(lynxjura$map, c("forets", "routes"),
       col=grey(seq(0,1, length=100)))




