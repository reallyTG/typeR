library(geosphere)


### Name: span
### Title: Span of polygons
### Aliases: span span,SpatialPolygons-method span,matrix-method
### Keywords: methods spatial

### ** Examples

pol <- rbind(c(-180,-20), c(-160,5), c(-60, 0), c(-160,-60), c(-180,-20))
plot(pol)
lines(pol)
# lon and lat span in m
span(pol, fun=max) 
x <- span(pol) 
max(x$latspan)
mean(x$latspan)
plot(x$longitude, x$lonspan)



