library(shotGroups)


### Name: drawBox2
### Title: Draw an oriented box
### Aliases: drawBox2 drawBox2.list drawBox2.default

### ** Examples

xy  <- matrix(round(rnorm(20, 100, 15), 1), ncol=2)
(bb <- getMinBBox(xy))

plot(xy, xlim=range(c(xy[ , 1], bb$pts[ , 1])),
         ylim=range(c(xy[ , 2], bb$pts[ , 2])), asp=1, pch=16)
drawBox2(bb, fg='blue', colCtr='blue', pch=4, cex=2)



