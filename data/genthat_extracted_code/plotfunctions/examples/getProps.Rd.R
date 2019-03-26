library(plotfunctions)


### Name: getProps
### Title: Transform coordinates into proportions of the figure or plot
###   region.
### Aliases: getProps

### ** Examples

# not very easy-to-calculate-with x- and y-axis values
emptyPlot(c(-2.35, 37.4), c(9,11), v0=0)
# draw a mirror symmetric image of boxes:
p1 <- c(9.5, 9.5)
p2 <- c(4,9.7)
p3 <- c(20,9)
p1m <- getCoords(1-getProps(p1, side=c(1,2)), side=c(1,2))
p2m <- getCoords(1-getProps(p2, side=c(1,2)), side=c(1,2))
p3m <- getCoords(1-getProps(p3, side=c(1,2)), side=c(1,2))
xdist <- diff(getCoords(c(0,.1), side=1))
ydist <- diff(getCoords(c(0,.1), side=2))
rect(xleft=c(p1[1],p2[1], p3[1], p1m[1], p2m[1], p3m[1])-xdist, 
    xright=c(p1[1],p2[1], p3[1], p1m[1], p2m[1], p3m[1])+xdist,
    ybottom=c(p1[2],p2[2], p3[2], p1m[2], p2m[2], p3m[2])-ydist, 
    ytop=c(p1[2],p2[2], p3[2], p1m[2], p2m[2], p3m[2])+ydist, 
    col=rep(c("red", NA, "lightblue"),2), xpd=TRUE )




