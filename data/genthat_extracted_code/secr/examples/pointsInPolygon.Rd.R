library(secr)


### Name: pointsInPolygon
### Title: Points Inside Polygon
### Aliases: pointsInPolygon
### Keywords: manip

### ** Examples


## 100 random points in unit square
xy <- matrix(runif(200), ncol = 2)
## triangle centred on (0.5, 0.5)
poly <- data.frame(x = c(0.2,0.5,0.8,0.2), y = c(0.2,0.8,0.2,0.2))
plot(xy, pch = 1 + pointsInPolygon(xy, poly))
lines(poly)




