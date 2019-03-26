library(splancs)


### Name: areapl
### Title: Calculate area of polygon
### Aliases: areapl
### Keywords: spatial

### ** Examples

x <- c(1,0,0,1,1,1,1,3,3,1)
y <- c(0,0,1,1,0,0,-1,-1,0,0)
m <- cbind(x, y)
plot(m, type="b")
areapl(m)
areapl(m[1:5,])
areapl(m[6:10,])



