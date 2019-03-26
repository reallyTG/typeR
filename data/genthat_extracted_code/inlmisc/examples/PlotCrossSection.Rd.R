library(inlmisc)


### Name: PlotCrossSection
### Title: Plot Cross Section
### Aliases: PlotCrossSection
### Keywords: hplot

### ** Examples

m <- datasets::volcano
m <- m[nrow(m):1, ncol(m):1]
x <- seq(from = 2667405, length.out = ncol(m), by = 10)
y <- seq(from = 6478705, length.out = nrow(m), by = 10)
r1 <- raster::raster(m, xmn = min(x), xmx = max(x), ymn = min(y), ymx = max(y),
                     crs = "+init=epsg:27200")
r2 <- min(r1[]) - r1 / 10
r3 <- r1 - r2
rs <- raster::stack(r1, r2, r3)
names(rs) <- c("r1", "r2", "r3")
xy <- rbind(c(2667508, 6479501), c(2667803, 6479214), c(2667508, 6478749))
transect <- sp::SpatialLines(list(sp::Lines(list(sp::Line(xy)), ID = "Transect")),
                             proj4string = raster::crs(rs))
xy <- rbind(c(2667705, 6478897), c(2667430, 6479178))
p <- sp::SpatialPoints(xy, proj4string = raster::crs(rs))
d <-  data.frame("label" = c("Peak", "Random"))
features <- sp::SpatialPointsDataFrame(p, d, match.ID = TRUE)
PlotMap(r1, pal = GetColors(scheme = "DEM screen"), scale.loc = "top",
        arrow.loc = "topright", shade = list(alpha = 0.3),
        contour.lines = list(col = "#1F1F1FA6"))
lines(transect)
raster::text(as(transect, "SpatialPoints"), labels = c("A", "BEND", "A'"),
             halo = TRUE, cex = 0.7, pos = c(3, 4, 1), offset = 0.1, font = 4)
points(features, pch = 19)
raster::text(features, labels = features@data$label, halo = TRUE,
             cex = 0.7, pos = 4, offset = 0.5, font = 4)

dev.new()
asp <- 5
unit <- "METERS"
explanation <- "Vertical thickness between layers, in meters."
PlotCrossSection(transect, rs, geo.lays = c("r1", "r2"), val.lays = "r3",
                 ylab = "Elevation", asp = asp, unit = unit,
                 explanation = explanation, features = features,
                 max.feature.dist = 100, bg.col = "#E1E1E1",
                 bend.label = "BEND IN\nSECTION", scale.loc = NULL)
AddScaleBar(unit = unit, vert.exag = asp, inset = 0.05)

val <- PlotCrossSection(transect, rs, geo.lays = c("r1", "r2"), val.lays = "r3",
                        ylab = "Elevation", asp = 5, unit = "METERS",
                        explanation = explanation, file = "Rplots.png")
print(val)

graphics.off()
file.remove("Rplots.png")




