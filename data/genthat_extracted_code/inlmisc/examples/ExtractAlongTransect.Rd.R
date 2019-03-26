library(inlmisc)


### Name: ExtractAlongTransect
### Title: Extract Raster Values Along a Transect Line
### Aliases: ExtractAlongTransect
### Keywords: utilities

### ** Examples

coords <- rbind(c(-100, -90), c(80, 90), c(80, 0), c(40, -40))
crs <- sp::CRS("+init=epsg:4326")
transect <- sp::SpatialPoints(coords, proj4string = crs)
r <- raster::raster(nrows = 10, ncols = 10, ymn = -80, ymx = 80, crs = crs)
names(r) <- "value"
set.seed(0)
r[] <- runif(raster::ncell(r))
r[4, 6] <- NA
PlotMap(r)
l <- sp::Lines(list(sp::Line(coords)), ID = "Transect")
lines(sp::SpatialLines(list(l), proj4string = crs))
points(transect, pch = 19)
segs <- ExtractAlongTransect(transect, r)
for (i in seq_along(segs)) points(segs[[i]])

dev.new()
xlab <- "Distance along transect"
ylab <- "Raster value"
xlim <- range(vapply(segs, function(i) range(i@data[, "dist"]), c(0, 0)))
ylim <- range(vapply(segs, function(i) range(i@data[, "value"], na.rm = TRUE), c(0, 0)))
plot(NA, type = "n", xlab = xlab, ylab = ylab, xlim = xlim, ylim = ylim)
cols <- GetColors(length(segs), scheme = "bright")
for (i in seq_along(segs))
  lines(segs[[i]]@data[, c("dist", "value")], col = cols[i])
coords <- sp::coordinates(transect)
n <- length(transect)
d <- cumsum(c(0, as.matrix(dist((coords)))[cbind(1:(n - 1), 2:n)]))
abline(v = d, col = "grey", lty = 2)
mtext(paste0("(", paste(head(coords, 1), collapse = ", "), ")"), adj = 0)
mtext(paste0("(", paste(tail(coords, 1), collapse = ", "), ")"), adj = 1)

graphics.off()




