library(obAnalytics)


### Name: plotPriceLevels
### Title: Plot order book price level heat map.
### Aliases: plotPriceLevels

### ** Examples


# bid/ask spread.
spread <- with(lob.data, getSpread(depth.summary))

## Not run: 
##D 
##D # plot all depth levels, rescaling the volume by 10^-8.
##D # produce 2 plots side-by-side: second plot contains depth levels with > 50
##D # units of volume.
##D p1 <- with(lob.data, plotPriceLevels(depth, spread,
##D                                        col.bias=0.1,
##D                                        volume.scale=10^-8))
##D p2 <- with(lob.data, plotPriceLevels(depth, spread,
##D                                        col.bias=0.1,
##D                                        volume.scale=10^-8,
##D                                        volume.from=50))
##D library(grid)
##D pushViewport(viewport(layout=grid.layout(1, 2)))
##D print(p1, vp=viewport(layout.pos.row=1, layout.pos.col=1))
##D print(p2, vp=viewport(layout.pos.row=1, layout.pos.col=2))
## End(Not run)

# zoom into 1 hour of activity, show the spread and directional trades. 
with(lob.data, plotPriceLevels(depth, spread, trades,
   start.time=as.POSIXct("2015-05-01 03:25:00.000", tz="UTC"),
   end.time=as.POSIXct("2015-05-01 04:25:00.000", tz="UTC"),
   volume.scale=10^-8))

# zoom in to 15 minutes of activity, show the bid/ask midprice.
with(lob.data, plotPriceLevels(depth, spread,
   show.mp=FALSE,
   start.time=as.POSIXct("2015-05-01 03:30:00.000", tz="UTC"),
   end.time=as.POSIXct("2015-05-01 03:45:00.000", tz="UTC")))




