library(SpatialEpi)


### Name: circle
### Title: Compute cartesian coordinates of a cluster center and radius
### Aliases: circle
### Keywords: internal

### ** Examples

data(pennLC)
geo <- pennLC$geo[,2:3]
plot(geo,type='n')
text(geo,labels=1:nrow(geo))
lines( circle(geo, 23, 46), col = "red" ) 



