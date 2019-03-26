library(geosphere)


### Name: destPoint
### Title: Destination given bearing (direction) and distance
### Aliases: destPoint
### Keywords: spatial

### ** Examples

p <- cbind(5,52)
d <- destPoint(p,30,10000)
d

#final direction, when arriving at endpoint: 
finalBearing(d, p)



