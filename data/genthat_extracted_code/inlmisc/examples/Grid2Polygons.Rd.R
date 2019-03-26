library(inlmisc)


### Name: Grid2Polygons
### Title: Convert Spatial Grids to Polygons
### Aliases: Grid2Polygons
### Keywords: manip

### ** Examples

# Example 1
z <- c(1.1,  1.5,  4.2,  4.1,  4.3,  4.7,
       1.2,  1.4,  4.8,  4.8,   NA,  4.1,
       1.7,  4.2,  1.4,  4.8,  4.0,  4.4,
       1.1,  1.3,  1.2,  4.8,  1.6,   NA,
       3.3,  2.9,   NA,  4.1,  1.0,  4.0)
m <- 5
n <- 6
x <- rep(0:n, m + 1)
y <- rep(0:m, each = n + 1)
xc <- c(rep(seq(0.5, n - 0.5, by = 1), m))
yc <- rep(rev(seq(0.5, m - 0.5, by = 1)), each = n)
grd <- data.frame(z = z, xc = xc, yc = yc)
sp::coordinates(grd) <- ~ xc + yc
sp::gridded(grd) <- TRUE
grd <- as(grd, "SpatialGridDataFrame")
image(grd, col = gray.colors(30), axes = TRUE)
grid(col = "black", lty = 1)
points(x = x, y = y, pch = 16)
text(cbind(xc, yc), labels = z)
text(cbind(x = x + 0.1, y = rev(y + 0.1)),
     labels = 1:((m + 1) * (n + 1)), cex = 0.6)
at <- 1:ceiling(max(z, na.rm = TRUE))
plys <- Grid2Polygons(grd, level = TRUE, at = at)
cols <- GetColors(length(plys), scheme = "bright", alpha = 0.3)
sp::plot(plys, add = TRUE, col = cols)
zz <- plys[[1]]
legend("top", legend = zz, fill = cols, bty = "n", xpd = TRUE,
       inset = c(0, -0.1), ncol = length(plys))

v1 <- rbind(c( 1.2, 0.5), c(5.8, 1.7), c( 2.5, 5.1), c( 1.2, 0.5))
v2 <- rbind(c( 2.5, 2.5), c(3.4, 1.8), c( 3.7, 3.1), c( 2.5, 2.5))
v3 <- rbind(c(-0.3, 3.3), c(1.7, 5.1), c(-1.0, 7.0), c(-0.3, 3.3))
p1 <- sp::Polygon(v1, hole = FALSE)
p2 <- sp::Polygon(v2, hole = TRUE)
p3 <- sp::Polygon(v3, hole = FALSE)
p <- sp::SpatialPolygons(list(sp::Polygons(list(p1, p2, p3), 1)))
plys <- Grid2Polygons(grd, level = TRUE, at = at, ply = p)
cols <- GetColors(length(zz), scheme = "bright", alpha = 0.6)
cols <- cols[zz %in% plys[[1]]]
sp::plot(plys, col = cols, add = TRUE)
text(cbind(xc, yc), labels = z)

# Example 2
data(meuse.grid, package = "sp")
sp::coordinates(meuse.grid) <- ~ x + y
sp::gridded(meuse.grid) <- TRUE
meuse.grid <- as(meuse.grid, "SpatialGridDataFrame")
meuse.plys <- Grid2Polygons(meuse.grid, "dist", level = FALSE)
op <- par(mfrow = c(1, 2), oma = rep(0, 4), mar = rep(0, 4))
sp::plot(meuse.plys, col = heat.colors(length(meuse.plys)))
title("level = FALSE", line = -7)
meuse.plys.lev <- Grid2Polygons(meuse.grid, "dist", level = TRUE)
sp::plot(meuse.plys.lev, col = heat.colors(length(meuse.plys.lev)))
title("level = TRUE", line = -7)
par(op)

# Example 3
m <- datasets::volcano
m <- m[nrow(m):1, ncol(m):1]
x <- seq(from = 2667405, length.out = ncol(m), by = 10)
y <- seq(from = 6478705, length.out = nrow(m), by = 10)
r <- raster::raster(m, xmn = min(x), xmx = max(x), ymn = min(y), ymx = max(y),
                    crs = "+init=epsg:27200")
plys <- Grid2Polygons(r, level = TRUE)
cols <- GetColors(length(plys), scheme = "DEM screen")
sp::plot(plys, col = cols, border = "#515151")




