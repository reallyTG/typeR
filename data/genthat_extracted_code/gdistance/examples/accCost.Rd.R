library(gdistance)


### Name: accCost
### Title: Accumulated Cost Surface
### Aliases: accCost accCost,TransitionLayer,RasterLayer-method
###   accCost,TransitionLayer,Coords-method
### Keywords: spatial

### ** Examples

#example equivalent to that in the documentation on r.cost in GRASS
r <- raster(nrows=6, ncols=7, xmn=0, xmx=7, ymn=0, ymx=6, crs="+proj=utm +units=m")
 
r[] <- c(2, 2, 1, 1, 5, 5, 5,
         2, 2, 8, 8, 5, 2, 1,
         7, 1, 1, 8, 2, 2, 2,
         8, 7, 8, 8, 8, 8, 5,
         8, 8, 1, 1, 5, 3, 9,
         8, 1, 1, 2, 5, 3, 9)

T <- transition(r, function(x) 1/mean(x), 8) 
# 1/mean: reciprocal to get permeability
T <- geoCorrection(T)

c1 <- c(5.5,1.5) 
c2 <- c(1.5,5.5)

A <- accCost(T, c1)
plot(A)
text(A)




