library(autoimage)


### Name: autoimage
### Title: Automatic facetting of multiple projected images
### Aliases: autoimage

### ** Examples

data(narccap)
# restructure data for 2 images
tasmax2 <- tasmax[,,1:2]

# plot irregularly gridded images with separate legends
# and usa border
autoimage(lon, lat, tasmax2, common.legend = FALSE, map = "usa")

# plot irregularly gridded images with common legend and world lines
# customize world lines
# add and customize title
autoimage(lon, lat, tasmax2, map = "world", 
          lines.args = list(col = "white", lwd = 2),
          outer.title = "Maximum Daily Surface Air Temperature (K)",
          mtext.args = list(col = "blue", cex = 2))

# plot irregularly-spaced responsed as images with separate legends
# and county borders.  Add observed data locations with custom point
# options.  Add text at locations of Denver and Colorado Springs.
data(co, package = "gear")
autoimage(co$lon, co$lat, co[,c("Al", "Ca")], common.legend = FALSE, 
          map = "county", main = c("Aluminum", "Cadmium"),
          points = list(x = co$lon, y = co$lat),
          points.args = list(pch = 20, col = "white"),
          text = list(x = c(-104.98, -104.80), y = c(39.74, 38.85), 
                      labels = c("Denver", "Colorado Springs")),
          text.args = list(col = "red"))

# customize margins and lratio for large plot
# also use projection
# specify manual lines (though in this case it is the same as using 
# map = "world")
data(worldMapEnv, package = "maps")
worldpoly <- maps::map("world", plot = FALSE)
par(mar = c(1.1, 4.1, 2.1, 1.1))
autoimage(lon, lat, tasmax, lines = worldpoly, 
          proj = "bonne", parameters = 40,
          main = c("day 1", "day 2", "day 3", "day 4", "day 5"),
          ylab = "",
          axes = FALSE,
          lratio = 0.5)



