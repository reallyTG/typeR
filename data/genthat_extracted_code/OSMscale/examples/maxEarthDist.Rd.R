library(OSMscale)


### Name: maxEarthDist
### Title: maximum distance between set of points
### Aliases: maxEarthDist
### Keywords: spatial

### ** Examples


d <- read.table(header=TRUE, text="
    x     y
9.19 45.73
6.55 58.13
7.71 71.44")

plot(d, asp=1, pch=as.character(1:3))
earthDist(y,x,d, i=2)
earthDist(y,x,d, i=3)

maxEarthDist(y,x,d)




