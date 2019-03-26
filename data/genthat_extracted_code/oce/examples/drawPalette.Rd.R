library(oce)


### Name: drawPalette
### Title: Draw a palette, leaving margins suitable for accompanying plot
### Aliases: drawPalette

### ** Examples


library(oce)
par(mgp=getOption("oceMgp"))

## 1. A three-panel plot
par(mfrow=c(3, 1), mar=c(3, 3, 1, 1))
omar <- par('mar')                 # save initial margin

## 1a. top panel: simple case
drawPalette(zlim=c(0, 1), col=oce.colorsJet(10))
plot(1:10, 1:10, col=oce.colorsJet(10)[1:10],pch=20,cex=3,xlab='x', ylab='y')
par(mar=omar)                      # reset margin

## 1b. middle panel: colormap
cm <- colormap(name="gmt_globe")
drawPalette(colormap=cm)
icol <- seq_along(cm$col)
plot(icol, cm$breaks[icol], pch=20, cex=2, col=cm$col,
     xlab="Palette index", ylab="Palette breaks")
par(mar=omar)                      # reset margin

## 1c. bottom panel: space for palette (to line up graphs)
drawPalette(plot=FALSE)
plot(1:10, 1:10, col=oce.colorsJet(10)[1:10],pch=20,cex=3,xlab='x', ylab='y')
par(mar=omar)                      # reset margin

# 2. Use layout to mimic the action of imagep(), with the width
# of the palette region being 14 percent of figure width.
d <- 0.14
layout(matrix(1:2,nrow=1), widths=c(1-d,d))
image(volcano, col=oce.colorsJet(100), zlim=c(90, 200))
contour(volcano, add=TRUE)
drawPalette(c(90, 200), fullpage=TRUE, col=oce.colorsJet)



