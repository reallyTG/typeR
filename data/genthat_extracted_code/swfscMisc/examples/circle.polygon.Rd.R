library(swfscMisc)


### Name: circle.polygon
### Title: Circle Polygon (on Earth)
### Aliases: circle.polygon

### ** Examples

cart.earth <- circle.polygon(-117.24, 32.86, 40, poly.type = "cart.earth")

lat.range <- c(32, 34)
lon.range <- c(-118.5, -116)

op <- par(mar = c(3, 5, 5, 5) + 0.1, oma = c(1, 1, 1, 1))

map("worldHires", fill = TRUE, col = "wheat3", xlim = lon.range, ylim = lat.range)
points(-117.24, 32.86, pch = 19, col = "red")
polygon(cart.earth, border = "red", lwd = 3)
lat.lon.axes(n = 3)
box(lwd = 2)
mtext("poly.type = 'cart.earth'", line = 3)

par(op)




