library(ndtv)


### Name: layout.center
### Title: Functions to center and normalize the coordinates of a network
###   plot within a window.
### Aliases: layout.center layout.normalize

### ** Examples

data(McFarland_cls33_10_16_96)
coords<-plot(cls33_10_16_96)

# center layout coords with 100 unit area
layout.center(coords,xlim=c(0,100),ylim=c(0,100))

# rescale layout coords to unit interval
layout.normalize(coords)



