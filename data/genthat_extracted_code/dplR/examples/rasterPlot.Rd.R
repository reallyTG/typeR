library(dplR)


### Name: rasterPlot
### Title: Add Raster Elements to Plot
### Aliases: rasterPlot
### Keywords: aplot utilities

### ** Examples
library(graphics)
library(stats)

## Picture with various graphical elements
x <- 1:100
y0 <- quote(sin(pi * x / 20) + x / 100 + rnorm(100, 0, 0.2))
y <- eval(y0)
ylab <- deparse(y0)
spl <- smooth.spline(y)
plot(x, y, type = "n", axes = FALSE, ylab = ylab)
usr <- par("usr")
xrange <- usr[2] - usr[1]
xsize <- xrange * 0.4
nsteps <- 8
xmar <- xsize / 20
yrange <- usr[4] - usr[3]
ysize <- yrange / 20
ymar <- 0.5 * ysize
X <- seq(usr[1] + xmar, by = xsize / nsteps, length.out = nsteps + 1)
xleft <- X[-(nsteps + 1)]
xright <- X[-1]
pin <- par("pin")
maxrad <- xsize / 3 * min(1, pin[2] / pin[1])
nrad <- 16
minrad <- maxrad / nrad
Rad <- seq(maxrad, by = (minrad - maxrad) / (nrad - 1), length.out=nrad)
xmar2 <- xmar + maxrad
ymar2 <- (xmar2 / xrange) * pin[1] / pin[2] * yrange
expr <- quote({
    rect(xleft, usr[4] - 1.5 * ysize, xright, usr[4] - ymar,
         col = rainbow(8), border = NA)
    symbols(rep(usr[2] - xmar2, nrad), rep(usr[3] + ymar2, nrad),
            circles = Rad, inches = FALSE, add = TRUE, fg = NA,
            bg = gray.colors(nrad + 1, 1, 0)[-1])
    points(y)
    lines(spl)
})
rasterPlot(expr, res = 50)
box()
axis(1)
axis(2)

## The same picture with higher resolution but no antialiasing
plot(y, type = "n", axes = FALSE, ann = FALSE)
## No content in margin, but region = "figure" and bg = "white"
## paints margin white
rasterPlot(expr, antialias = "none", interpolate = FALSE,
           region = "figure", bg = "white")
## Draw box, axes, labels
parnew <- par(new = TRUE)
plot(x, y, type = "n", ylab = ylab)
par(parnew)

## Draw plot(1:5) with adjusted margins and additional axes.  Some parts
## are drawn with rasterPlot, others normally.  Resize to see stretching.
op <- par(no.readonly = TRUE)
par(mar = c(5.1, 4.1, 2.1, 2.1))
plot(1:5, type = "n", axes = FALSE, ann = FALSE)
expr2 <- quote({
    points(c(2, 4), c(2, 4))
    axis(2)
    axis(3)
})
rasterPlot(expr2, region = "figure", bg = "white")
points(c(1, 3, 5), c(1, 3, 5))
box()
axis(1)
axis(4)
title(xlab = "Index", ylab = "1:5")
par(op)



