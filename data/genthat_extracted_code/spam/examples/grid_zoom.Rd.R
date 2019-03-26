library(spam)


### Name: grid_zoom
### Title: grid_zoom
### Aliases: grid_zoom
### Keywords: zoom_grid zoom plot grid

### ** Examples

## -- Example 1 --
set.seed(133)
grid_zoom(inputGrob = pointsGrob(runif(200), runif(200)),
          inputViewport = viewport(name = 'main'),
          zoom_xlim = c(.2, .3), zoom_ylim = c(.2, .3))


## -- Example 2 --
## initial plot
grid.newpage()
vp <- viewport(width=.8, height=.8, clip='on')
gt <- gTree(children=gList(polylineGrob(x=c((0:4)/10, rep(.5, 5), (10:6)/10, rep(.5, 5)),
              y=c(rep(.5, 5), (10:6/10), rep(.5, 5), (0:4)/10),
              id=rep(1:5, 4), default.units='native',
              gp=gpar(col=1:5, lwd=3)),
              pointsGrob(runif(1000), runif(1000),pch='.', gp=gpar(cex=3)),
              rectGrob(gp=gpar(lwd=3))))
pushViewport(vp)
grid.draw(gt)

## plot with zoom window
grid.newpage()
grid_zoom(inputGrob = gt,
          inputViewport = vp,
          x='topright', zoom_xlim=c(.6,.73), zoom_ylim=c(.3,.43),ratio=.4,
          zoom_xaxis = NULL, zoom_gp = gpar(cex=3))



