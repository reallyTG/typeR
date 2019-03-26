library(autoimage)


### Name: paxes
### Title: Display axes for projected coordinates
### Aliases: paxes

### ** Examples

data(narccap)
# plot image using mercator projection (w/o axes)
pimage(lon, lat, tasmax[,,1], proj = "mercator", axes = FALSE)
# add axes with grey grid lines, blue text, and custom spacing
paxes("mercator", xlim = range(lon), ylim = range(lat), 
      col = "grey", 
      axis.args = list(col.axis = "blue", 
                       xat = c(-160, -100, -90, -80, -20)))



