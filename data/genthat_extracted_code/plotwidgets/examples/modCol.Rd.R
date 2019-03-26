library(plotwidgets)


### Name: modCol
### Title: Modify colors
### Aliases: contrastcol darkenCol modCol modhueCol saturateCol

### ** Examples

plot.new()
## Loop over a few saturation / lightess values
par(usr=c(-0.5, 0.5, -0.5, 0.5))
v <- c(10, 9, 19, 9, 15, 5)
pal <- plotPals("zeileis")
for(sat in seq.int(-0.4, 0.4, length.out=5)) {
  for(lgh in seq.int(-0.4, 0.4, length.out=5)) {
    cols <- saturateCol(darkenCol(pal, by=sat), by=lgh)
    wgPlanets(x=sat, y=lgh, w=0.16, h=0.16, v=v, col=cols)
  }
}
axis(1)
axis(2)
title(xlab="Darkness (L) by=", ylab="Saturation (S) by=")

## Now loop over hues
a2xy <- function(a, r=1, full=FALSE) {
  t <- pi/2 - 2 * pi * a / 360
  list( x=r * cos(t), y=r * sin(t) )
}

plot.new()
par(usr=c(-1,1,-1,1))
hues <- seq(0, 360, by=30)
pos <- a2xy(hues, r=0.75)
for(i in 1:length(hues)) {
  cols <- modhueCol(pal, by=hues[i])
  wgPlanets(x=pos$x[i], y=pos$y[i], w=0.5, h=0.5, v=v, col=cols)
}

pos <- a2xy(hues[-1], r=0.4)
text(pos$x, pos$y, hues[-1])



