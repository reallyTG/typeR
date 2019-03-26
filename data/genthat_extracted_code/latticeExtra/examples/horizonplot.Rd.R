library(latticeExtra)


### Name: horizonplot
### Title: Plot many time series in parallel
### Aliases: horizonplot horizonplot.default panel.horizonplot
###   prepanel.horizonplot
### Keywords: hplot ts

### ** Examples

## generate a random time series object with 12 columns
set.seed(1)
dat <- ts(matrix(cumsum(rnorm(200 * 12)), ncol = 12))
colnames(dat) <- paste("series", LETTERS[1:12])

## show simple line plot first, for reference.
xyplot(dat, scales = list(y = "same"))

## these layers show scale and origin in each panel...
infolayers <-
  layer(panel.scaleArrow(x = 0.99, digits = 1, col = "grey",
                         srt = 90, cex = 0.7)) +
  layer(lim <- current.panel.limits(),
    panel.text(lim$x[1], lim$y[1], round(lim$y[1],1), font = 2,
        cex = 0.7, adj = c(-0.5,-0.5), col = "#9FC8DC"))

## Case 1: each panel has a different origin and scale:
## ('origin' default is the first data value in each series).
horizonplot(dat, layout = c(1,12), colorkey = TRUE) +
  infolayers
 
## Case 2: fixed scale but different origin (baseline):
## (similar in concept to scales = "sliced")
horizonplot(dat, layout = c(1,12), horizonscale = 10, colorkey = TRUE) +
  infolayers

## Case 3: fixed scale and constant origin (all same scales):
horizonplot(dat, layout = c(1,12), origin = 0, horizonscale = 10, colorkey = TRUE) +
  infolayers

## same effect using ylim (but colorkey does not know limits):
horizonplot(dat, layout = c(1,12), ylim = c(0, 10), colorkey = TRUE) +
  infolayers

## same scales with full coverage of color scale:
horizonplot(dat, layout = c(1,12), origin = 0,
            scales = list(y = list(relation = "same")),
            colorkey = TRUE, colorkey.digits = 1) +
  infolayers


## use ylab rather than strip.left, for readability.
## also shade any times with missing data values.
horizonplot(dat, horizonscale = 10, colorkey = TRUE,
            layout = c(1,12), strip.left = FALSE,
            ylab = list(rev(colnames(dat)), rot = 0, cex = 0.7)) +
  layer_(panel.fill(col = "gray90"), panel.xblocks(..., col = "white"))


## illustration of the cut points used in the following plot
xyplot(EuStockMarkets, scales = list(y = "same"),
  panel = function(x, y, ...) {
    col <-
    c("#B41414","#E03231","#F7A99C","#9FC8DC","#468CC8","#0165B3")
    for (i in c(-3:-1, 2:0)) {
      if (i >= 0)
        yi <- pmax(4000, pmin(y, 4000 + 1000 * (i+1)))
      if (i < 0)
        yi <- pmin(4000, pmax(y, 4000 + 1000 * i))
      panel.xyarea(x, yi, origin = 4000,
        col = col[i+4], border = NA)
    }
    panel.lines(x, y)
    panel.abline(h = 4000, lty = 2)
  })

## compare with previous plot
horizonplot(EuStockMarkets, colorkey = TRUE,
            origin = 4000, horizonscale = 1000) +
  infolayers

## a cut-and-stack plot; use constant y scales!
horizonplot(sunspots, cut = list(n = 23, overlap = 0),
  scales = list(draw = FALSE, y = list(relation = "same")),
  origin = 100, colorkey = TRUE,
  strip.left = FALSE, layout = c(1,23)) +
layer(grid::grid.text(round(x[1]), x = 0, just = "left"))



