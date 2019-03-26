library(autoimage)


### Name: autolegend
### Title: Add legend to projected image.
### Aliases: autolegend

### ** Examples

data(narccap)
autolayout(c(1, 1), legend = "h")
pimage(lon, lat, tasmax[,,1], legend = "none")
autolegend()

# common legend with distinct lines
autolayout(c(1, 2), legend = "h")
pimage(lon, lat, tasmax[,,1], legend = "none", map = "world")
pimage(lon, lat, tasmax[,,2], legend = "none", map = "usa", 
       proj = "bonne", parameters = 40)
autolegend()

# separate legends with distinct lines
autolayout(c(1, 2), legend = "v", common.legend = FALSE)
pimage(lon, lat, tasmax[,,1], legend = "none", map = "state",
       proj = "bonne", parameters = 40, axes = FALSE)
autolegend()
pimage(lon, lat, tasmax[,,2], legend = "none", map = "usa", 
       proj = "albers", parameters = c(32, 45), axes = FALSE)
autolegend()

data(worldMapEnv, package = "maps")
# extract hawaii and alaskan borders
hiak <- maps::map("world", c("USA:Hawaii", "USA:Alaska"), 
                  plot = FALSE)
# extract colorado cities from us.cities
data(us.cities, package = "maps")
codf <- us.cities[us.cities$country.etc == "CO", ]
# select smaller subset of colorado cities
codf <- codf[c(3, 5, 7:11, 15, 18), ]
# extract capitals from us.cities
capdf <- us.cities[us.cities$capital == 2,]

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
pimage(co$lon, co$lat, co$Al, map = "county", legend = "none",
       proj = "bonne", parameters = 39, 
       paxes.args = list(grid = FALSE),
       col = fields::tim.colors(64), 
       lines.args = list(col = "grey"))
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

reset.par() # reset device default



