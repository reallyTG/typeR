library(OSMscale)


### Name: earthDist
### Title: distance between lat-long coordinates
### Aliases: earthDist
### Keywords: spatial

### ** Examples

d <- read.table(header=TRUE, sep=",", text="
lat, long
52.514687,  13.350012   # Berlin
51.503162,  -0.131082   # London
35.685024, 139.753365") # Tokio
earthDist(lat, long, d)      # from Berlin to L and T: 928 and 8922 km
earthDist(lat, long, d, i=2) # from London to B and T: 928 and 9562 km

# slightly different with other formulas:
# install.packages("geosphere")
# geosphere::distHaversine(as.matrix(d[1,2:1]), as.matrix(d[2,2:1])) / 1000


# compare with UTM distance
set.seed(42)
d <- data.frame(lat=runif(100, 47,54), long=runif(100, 6, 15))
d2 <- projectPoints(d$lat, d$long)
d_utm <- berryFunctions::distance(d2$x[-1],d2$y[-1], d2$x[1],d2$y[1])/1000
d_earth <- earthDist(lat,long, d)[-1]
plot(d_utm, d_earth) # distances in km
hist(d_utm-d_earth) # UTM distance slightly larger than earth distance
plot(d_earth, d_utm-d_earth) # correlates with distance
berryFunctions::colPoints(d2$x[-1], d2$y[-1], d_utm-d_earth, add=FALSE)
points(d2$x[1],d2$y[1], pch=3, cex=2, lwd=2)





