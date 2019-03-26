library(shotGroups)


### Name: drawBox
### Title: Draw an axis-aligned box
### Aliases: drawBox drawBox.list drawBox.default

### ** Examples

xy  <- matrix(round(rnorm(20, 100, 15), 1), ncol=2)
(bb <- getBoundingBox(xy))

plot(xy, asp=1, pch=16)
drawBox(bb, fg='blue', colCtr='blue', pch=4, cex=2)



