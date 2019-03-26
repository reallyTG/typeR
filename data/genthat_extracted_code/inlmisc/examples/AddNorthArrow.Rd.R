library(inlmisc)


### Name: AddNorthArrow
### Title: Add North Arrow to Plot
### Aliases: AddNorthArrow
### Keywords: hplot

### ** Examples

m <- datasets::volcano
m <- m[nrow(m):1, ncol(m):1]
x <- seq(from = 2667405, length.out = ncol(m), by = 10)
y <- seq(from = 6478705, length.out = nrow(m), by = 10)
r <- raster::raster(m, xmn = min(x), xmx = max(x), ymn = min(y), ymx = max(y),
                    crs = "+init=epsg:27200")
PlotMap(r, pal = GetColors(scheme = "DEM screen"))
AddNorthArrow(raster::crs(r), loc = "center")
AddNorthArrow(raster::crs(r), inset = 0.1)
AddNorthArrow(raster::crs(r), loc = "topleft", inset = 0.1)




