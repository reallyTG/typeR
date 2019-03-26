library(csrplus)


### Name: mwin
### Title: Moving Window Approach to Quadrat Counts
### Aliases: mwin

### ** Examples

# To load data corresponding to the location of earthquakes in California:
data(quake)

# To load data corresponding to the boundary:
data(boundary)

# To compute quadrat counts with a 40 x 40 lattice and 1 x 1 unit window:
m <- mwin(quake[,3], quake[,2], boundary[,1], boundary[,2], 40, 40, 1, 1)

# To plot the results (with the shading corresponding to the quadrat count):
layout(matrix(c(1,2), nc=2), widths = c(4, 1))
palette(rev(heat.colors((max(as.numeric(m$quadrat))-min(as.numeric(m$quadrat))))))
plot(m$xgrid, m$ygrid, col=m$quadrat, pch=15, cex=.8,
     xlab="X-Coordinates", ylab="Y Coordinates", main="Quadrat Count")
lines(boundary[,1], boundary[,2])
breaks <- seq(min(as.numeric(m$quadrat)), (max(as.numeric(m$quadrat))), by=1)
plot.new()
plot.window(xlim = c(0, 1),ylim = range(breaks),xaxs = "i", yaxs = "i")
rect(0, breaks[-length(breaks)],1, breaks[-1],
col = rev(heat.colors(length(breaks) - 1)))
axis(2)



