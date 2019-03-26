library(plotfunctions)


### Name: getFigCoords
### Title: Get the figure region as coordinates of the current plot region,
###   or as corrdinates of the figure region.
### Aliases: getFigCoords

### ** Examples

# setup plot region:
emptyPlot(1,1, bty='o')
fc <- getFigCoords()
pc <- getFigCoords('p')
arrows(x0=pc[c(1,2,1,2)], x1=fc[c(1,2,1,2)],
    y0=pc[c(3,3,4,4)], y1=fc[c(3,3,4,4)], xpd=TRUE)

# Same plot with different axis:
emptyPlot(c(250,500),c(331, 336), bty='o')
fc <- getFigCoords()
pc <- getFigCoords('p')
arrows(x0=pc[c(1,2,1,2)], x1=fc[c(1,2,1,2)],
    y0=pc[c(3,3,4,4)], y1=fc[c(3,3,4,4)], xpd=TRUE)
hc <-  getFigCoords('h')

# other options:
# 1. center of figure region:
abline(v=getFigCoords('hf')[1], col='blue', xpd=TRUE)
abline(h=getFigCoords('hf')[2], col='blue', xpd=TRUE)
# 2. center of plot region:
abline(v=getFigCoords('hp')[1], col='red', lty=3)
abline(h=getFigCoords('hp')[2], col='red', lty=3)




