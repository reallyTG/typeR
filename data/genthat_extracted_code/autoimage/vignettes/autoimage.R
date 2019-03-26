## ----setup, include=FALSE------------------------------------------------
library(autoimage)

## ---- fig.height=5, fig.width=4------------------------------------------
data(narccap)
pimage(x = lon, y = lat, z = tasmax[,,1])

## ---- fig.height=5, fig.width=4------------------------------------------
data(co, package = "gear")
pimage(co$longitude, co$latitude, co$Al, 
       xlab = "lon", ylab = "lat")

## ---- fig.height = 5, fig.width = 4--------------------------------------
pimage(lon, lat, tasmax[,,1], col = viridisLite::magma(6))

## ---- fig.height=4, fig.width=5------------------------------------------
pimage(x = lon, y = lat, z = tasmax[,,1], legend = "vertical")

## ---- fig.height=5, fig.width=4------------------------------------------
pimage(x = lon, y = lat, z = tasmax[,,1], proj = "bonne", 
       parameters = 45)

## ---- fig.height=5, fig.width=4------------------------------------------
pimage(x = lon, y = lat, z = tasmax[,,1], proj = "bonne", 
       parameters = 45, map = "world")

## ---- fig.height=5, fig.width=7------------------------------------------
autoimage(lon, lat, tasmax)

## ---- fig.height=5, fig.width=4------------------------------------------
autoimage(co$longitude, co$latitude, co[,c("Al", "Ca", "Fe", "K")],
           main = c("(a) Aluminum %", "(b) Calcium %", 
                    "(c) Iron %", "(d) Potassium %"),
          xlab = "lon", ylab = "lat")

## ---- fig.height=5, fig.width=4------------------------------------------
autoimage(co$longitude, co$latitude, co[,c("Al", "Ca", "Fe", "K")],
          common.legend = FALSE,
          main = c("(a) Aluminum %", "(b) Calcium %", 
                   "(c) Iron %", "(d) Potassium %"),
          xlab = "lon", ylab = "lat")

## ---- fig.height=3, fig.width=7------------------------------------------
autoimage(lon, lat, tasmax[,,1:3], size = c(1, 3))

## ---- fig.height = 6, fig.width = 7--------------------------------------
autoimage(lon, lat, tasmax, outer.title = "tasmax for 5 days")

## ------------------------------------------------------------------------
autolayout(c(2, 3), legend = "v")

## ------------------------------------------------------------------------
# load world map
data(worldMapEnv, package = "maps")
# extract hawaii and alaskan borders
hiak <- maps::map("world", c("USA:Hawaii", "USA:Alaska"), 
                  plot = FALSE)
# load us city information
data(us.cities, package = "maps")
# extract colorado cities from us.cities
codf <- us.cities[us.cities$country.etc == "CO", ]
# select smaller subset of colorado cities
# extract capitals from us.cities
capdf <- us.cities[us.cities$capital == 2,]

## ---- fig.width=7, fig.height=5, hold=TRUE-------------------------------
# setup plotting area
autolayout(c(1, 2), legend = "h", common.legend = FALSE, outer = TRUE)
# create image of NARCCAP data.
# xlim is chosen so to include alaska and hawaii
# add grey state borders
pimage(lon, lat, tasmax[,,1], legend = "none", proj = "mercator",
       map = "state", xlim = c(-180, 20), 
       lines.args = list(col = "grey"))
# add hawaii and alaskan borders
plines(hiak, proj = "mercator", col = "grey")
# add state captials to image
ppoints(capdf$lon, capdf$lat, proj = "mercator", pch = 16)
# title image
title("tasmax for North America")
# add legend for plot
autolegend()
# load colorado geochemical data
data(co, package = "gear")
# create image for colorado aluminum measurements
# use bonne projection
# customize legend colors
# add grey county borders
# exclude grid
pimage(co$lon, co$lat, co$Al, map = "county", legend = "none",
       proj = "bonne", parameters = 39, 
       paxes.args = list(grid = FALSE),
       col = fields::tim.colors(64),
       lines.args = list(col = "grey"),
       xlab = "lon", ylab = "lat")
# add colorado city points to image
ppoints(codf$lon, codf$lat, pch = 16, proj = "bonne")
# add names of colorado cities to image
ptext(codf$lon, codf$lat, labels = codf$name, proj = "bonne", pos = 4)
# title plot
title("Colorado Aluminum levels (%)")
# add legend to current image
autolegend()
# add common title for plots
mtext("Two complicated maps", col = "purple", outer = TRUE, cex = 2)

## ------------------------------------------------------------------------
data(stateMapEnv, package = "maps")
statepoly <- maps::map("state", plot = FALSE)
citylist <- list(x = us.cities$long, y = us.cities$lat)

## ---- fig.height = 5, fig.width = 4--------------------------------------
pimage(lon, lat, tasmax[,,1], lines = statepoly, points = citylist)

## ---- fig.height = 5, fig.width = 4--------------------------------------
pimage(lon, lat, tasmax[,,1], lines = statepoly, points = citylist, 
       lines.args = list(lwd = 2, lty = 3, col = "white"),
       points.args = list(pch = 20, col = "blue"))

## ---- fig.height=4, fig.width=7------------------------------------------
citypoints = list(x = c(-104.98, -104.80), y = c(39.74, 38.85),
                  labels = c("Denver", "Colorado Springs"))
autoimage(co$lon, co$lat, co[,c("Al", "Ca")], common.legend = FALSE, 
          main = c("Aluminum", "Cadmium"), 
          points = citypoints,
          points.args = list(pch = 20, col = "white"),
          text = citypoints,
          text.args = list(pos = 3, col = "white"),
          xlab = "lon", ylab = "lat")

## ---- fig.height = 4, fig.width = 5--------------------------------------
pimage(lon, lat, tasmax[,,1], proj = "bonne", parameters = 40)

## ---- fig.height = 4, fig.width = 5--------------------------------------
pimage(lon, lat, tasmax[,,1], proj = "bonne", parameters = 40,
       axis.args = list(yat = seq(0, 70, by = 10), 
                        xat = seq(-220, 20, by = 20),
                        col.axis = "darkgrey", cex.axis = 0.9),
       paxes.args = list(col = "grey", lty = 2),
       legend.axis.args = list(cex.axis = 0.9),
       lratio = 0.3)

## ---- fig.height = 5, fig.width = 4--------------------------------------
pimage(lon, lat, tasmax[,,1], col = viridisLite::magma(6), 
       breaks = c(0, 275, 285, 295, 305, 315, 325),
       legend.axis.args = list(col.axis = "blue", las = 2, cex.axis = 0.75))

## ---- fig.height = 5, fig.width = 4.5------------------------------------
pimage(co$lon, co$lat, co$Al, interp.args = list(no.X = 100, no.Y = 100), 
       xlab = "lon", ylab = "lat")

## ---- fig.height = 5, fig.width = 6--------------------------------------
autoimage(lon, lat, tasmax, outer.title = "tasmax for 5 days",
          mtext.args = list(col = "blue", cex = 2))

## ---- fig.width = 4, fig.height = 4--------------------------------------
par(cex.axis = 0.5, cex.lab = 0.5, mgp = c(1.5, 0.5, 0),
    mar = c(2.1, 2.1, 2.1, 0.2), col.axis = "orange",
    col.main = "blue", family = "mono")
pimage(lon, lat, tasmax[,,1])
title("very customized plot")
reset.par()

