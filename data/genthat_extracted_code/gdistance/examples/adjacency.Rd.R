library(gdistance)


### Name: adjacencyFromTransition
### Title: Adjacent cells
### Aliases: adjacencyFromTransition
### Keywords: spatial

### ** Examples

r <- raster(nrows=6, ncols=7, xmn=0, xmx=7, ymn=0, ymx=6, crs="+proj=utm +units=m")
r[] <- runif(6*7)
T <- transition(r, function(x) 1/mean(x), 8) 
adjacencyFromTransition(T)



