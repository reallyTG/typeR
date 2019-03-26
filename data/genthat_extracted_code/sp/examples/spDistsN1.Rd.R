library(sp)


### Name: spDistsN1
### Title: Euclidean or Great Circle distance between points
### Aliases: spDistsN1 spDists
### Keywords: spatial

### ** Examples

ll <- matrix(c(5, 6, 60, 60), ncol=2)
km <- spDistsN1(ll, ll[1,], longlat=TRUE)
zapsmall(km)
utm32 <- matrix(c(276.9799, 332.7052, 6658.1572, 6655.2055), ncol=2)
spDistsN1(utm32, utm32[1,])
dg <- spDistsN1(ll, ll[1,])
dg
dg[2]/km[2]
data(meuse)
coordinates(meuse) <- c("x", "y")
res <- spDistsN1(meuse, meuse[1,])
summary(res)

p1 = SpatialPoints(cbind(1:3, 1:3))
spDists(p1)
spDists(p1, p1)
spDists(p1, p1, diagonal = TRUE)
try(spDists(p1, p1, segments = TRUE))
spDists(p1, segments = TRUE)
p2 = SpatialPoints(cbind(5:2, 2:5))
spDists(p1, p2)
try(spDists(p1, p2, diagonal = TRUE)) # fails
try(spDists(p1, p2, segments = TRUE)) # fails

# longlat points:
proj4string(p1) = "+proj=longlat +ellps=WGS84"
proj4string(p2) = "+proj=longlat +ellps=WGS84"
is.projected(p1)
is.projected(p2)
spDists(p1)
spDists(p1, p1)
spDists(p1, p1, diagonal = TRUE)
spDists(p1, p2)
try(spDists(p1, p2, diagonal = TRUE)) # fails
spDists(p1, p2[1:length(p1),], diagonal = TRUE)
spDists(p1, segments = TRUE)
spDists(p1[0],p2[0],diagonal=TRUE)
spDists(p1[0])

p1 = SpatialPoints(cbind(1:3, 1:3, 1:3))
spDists(p1)
spDists(p1, p1)
try(spDists(p1, p1, diagonal = TRUE))
try(spDists(p1, p1, segments = TRUE))
try(spDists(p1, segments = TRUE))
p2 = SpatialPoints(cbind(5:2, 2:5, 3:6))
spDists(p1, p2)
try(spDists(p1, p2, diagonal = TRUE)) # fails
try(spDists(p1, p2, segments = TRUE)) # fails




