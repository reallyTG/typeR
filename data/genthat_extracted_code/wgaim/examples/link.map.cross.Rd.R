library(wgaim)


### Name: link.map.cross
### Title: Plot a genetic linkage map
### Aliases: link.map.cross link.map
### Keywords: hplot

### ** Examples


data(genoSxT, package = "wgaim")

## plot linkage map with marker names

link.map(genoSxT, cex = 0.5)

## plot linkage map with distances

link.map(genoSxT, cex = 0.5, marker.names = "dist")




