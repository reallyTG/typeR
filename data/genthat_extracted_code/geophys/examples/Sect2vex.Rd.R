library(geophys)


### Name: Sect2vex
### Title: Intersect 2 Vectors
### Aliases: Sect2vex
### Keywords: misc

### ** Examples


v1 = matrix(runif(4), ncol=2)
v2 =  matrix(runif(4), ncol=2)


pt = Sect2vex(v1, v2)

plot(c(v1[,1],v2[,1],pt[1] ) , c(v1[,2],v2[,2],pt[2]) , asp=1)

arrows(v1[1,1], v1[1,2], v1[2,1], v1[2,2])
arrows(v2[1,1], v2[1,2], v2[2,1], v2[2,2])

points(pt[1], pt[2], col='red', cex=2, pch=3)









