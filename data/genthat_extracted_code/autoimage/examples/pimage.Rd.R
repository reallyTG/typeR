library(autoimage)


### Name: pimage
### Title: Display image for projected coordinates
### Aliases: pimage

### ** Examples

# image plot for data on an irregular grid
pimage(lon, lat, tasmax[,,1], legend = "h", map = "world")
# same plot but with projection and vertical legend
pimage(lon, lat, tasmax[,,1], legend = "v", map = "world", 
       proj = "bonne", parameters = 45)
# different projection
pimage(lon, lat, tasmax[,,1], proj = "albers",
       parameters = c(33, 45), map = "world")

reset.par() # reset graphics device
# image plot for non-gridded data
data(co, package = "gear")
pimage(co$longitude, co$latitude, co$Al)

# show observed locations on image,
# along with Colorado border, locations of Denver and Colorado 
# Springs
data(copoly)
copoints <- list(x = co$lon, y = co$lat)
pimage(co$longitude, co$latitude, co$Al, 
       lines = copoly, 
       lines.args = list(lwd = 2, col = "grey"),
       points = copoints, 
       points.args = list(pch = 21, bg = "white"),
       text = list(x = c(-104.98, -104.80), y = c(39.74, 38.85), 
                   labels = c("Denver", "Colorado Springs")), 
       text.args = list(col = "purple"),
       xlim = c(-109.1, -102),
       ylim = c(36.8, 41.1))

# image plot for data on irregular grid
# notice the poor axis labeling
data(narccap)
pimage(lon, lat, tasmax[,,1], proj = "bonne",
       parameters = 45, map = "world")
# same plot but customize axis labeling 
# need to extend horizontally-running axis lines
# farther to the west and east
# also need the vertically-running lines
# to run further north/sount
# will need manual adjusting depending on size
# of current device 
pimage(lon, lat, tasmax[,,1], proj = "bonne",
       parameters = 45, map = "world", 
       xaxp = c(-200, 0, 10), yaxp = c(-10, 80, 9))

# the same effect can be acheived by specifying axis.args
# we also modify the color and size of the axis labels
pimage(lon, lat, tasmax[,,1], proj = "bonne",
       parameters = 45, map = "world", 
       axis.args = list(xat = seq(-200, 0, by = 20),
                        yat = seq(0, 70, by = 10),
                        col.axis = "blue", 
                        cex.axis = 0.5))

# modify colors of legend, map, line type for grid lines
# and customize axis
pimage(lon, lat, tasmax[,,1], 
       legend = "v", proj = "bonne", parameters = 45,
       map = "state",
       paxes.args = list(lty = 3),
       legend.axis.args = list(col = "blue", col.axis = "blue"),
       col = fields::tim.colors(64),
       xlab = "longitude",
       ylab = "latitude",
       main = "temperature (K)")
reset.par() # reset graphics device

# change many aspects of plot appearance using par
par(cex.axis = 0.5, cex.lab = 0.5, mgp = c(1.5, 0.5, 0),
    mar = c(2.1, 2.1, 4.1, 0.2), col.axis = "orange",
    col.main = "blue", family = "mono")
pimage(lon, lat, tasmax[,,1])
title("very customized plot")
reset.par()




