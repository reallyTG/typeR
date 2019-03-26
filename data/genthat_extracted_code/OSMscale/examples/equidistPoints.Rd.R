library(OSMscale)


### Name: equidistPoints
### Title: Evenly spaced points along path
### Aliases: equidistPoints
### Keywords: spatial

### ** Examples

library(berryFunctions) # distance, colPoints etc
x <- c(2.7, 5, 7.8, 10.8, 13.7, 15.8, 17.4, 17.7, 16.2, 15.8, 15.1, 13.1, 9.3, 4.8, 6.8, 12.2)
y <- c(2.3, 2.1, 2.6, 3.3, 3.7, 4.7, 7.6, 11.7, 12.4, 12.3, 12.3, 12.3, 12, 12.1, 17.5, 19.6)
eP <- equidistPoints(x,y, n=10) ; eP
plot(x,y, type="o", pch=4)
points(equidistPoints(x,y, n=10), col=4, pch=16)
points(equidistPoints(x,y, n=10, nint=1), col=2) # from original point set
round(distance(eP$x, eP$y), 2) # the 2.69 instead of 4.50 is in the sharp curve
# These points are quidistant along the original track

plot(x,y, type="o", pch=16, col=2)
round(sort(distance(x,y)), 2)
xn <- equidistPoints(x,y, n=10)$x
yn <- equidistPoints(x,y, n=10)$y
lines(xn,yn, type="o", pch=16)
round(sort(distance(xn,yn)), 2)
for(i in 1:8)
{
xn <- equidistPoints(xn,yn, n=10)$x
yn <- equidistPoints(xn,yn, n=10)$y
lines(xn,yn, type="o", pch=16)
print(round(sort(distance(xn,yn)), 2))
} # We may recursively get closer to equidistant along track _and_ air,
# but never actually reach it.

# Real dataset:
data(biketrack)
colPoints(lon, lat, ele, data=biketrack, add=FALSE, asp=1, pch=4, lines=TRUE)
points(equidistPoints(lon, lat, data=biketrack, n=25), pch=3, lwd=3, col=2)
bt2 <- equidistPoints(lon, lat, ele, data=biketrack, n=25)
bt2$dist <- distance(bt2$x, bt2$y)*1000
colPoints(x, y, z, data=bt2, legend=FALSE)
# in curves, crow-distance is shorter sometimes
plot(lat~lon, data=biketrack, asp=1, type="l")
colPoints(x, y, dist, data=bt2, Range=c(2.5,4), add=TRUE, asp=1, pch=3, lwd=5)
lines(lat~lon, data=biketrack)




