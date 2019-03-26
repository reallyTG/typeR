library(shotGroups)


### Name: drawEllipse
### Title: Draw an ellipse
### Aliases: drawEllipse drawEllipse.list drawEllipse.default

### ** Examples

## error ellipse for a set of points
xy <- matrix(round(rnorm(100, 0, 8), 2), ncol=2)
ce <- getConfEll(xy)
plot(xy, pch=16, asp=1)
drawEllipse(ce, radius=1, axes=TRUE, fg='blue', colCtr='blue',
            lwd=2, pch=4, cex=2)



