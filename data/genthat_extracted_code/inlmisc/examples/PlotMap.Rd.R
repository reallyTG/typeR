library(inlmisc)


### Name: PlotMap
### Title: Plot Map
### Aliases: PlotMap
### Keywords: hplot

### ** Examples

r <- raster::raster(nrow = 10, ncol = 10, crs = NA)
r[] <- 1L
r[51:100] <- 2L
r[3:6, 1:5] <- 8L
r <- raster::ratify(r)
rat <- cbind(raster::levels(r)[[1]], land.cover = c("Pine", "Oak", "Meadow"))
levels(r) <- rat
PlotMap(r)

data(meuse, meuse.grid, package = "sp")
sp::coordinates(meuse.grid) <- ~x+y
sp::proj4string(meuse.grid) <- sp::CRS("+init=epsg:28992")
sp::gridded(meuse.grid) <- TRUE
meuse.grid <- raster::raster(meuse.grid, layer = "soil")
model <- gstat::gstat(id = "zinc", formula = zinc~1, locations = ~x+y, data = meuse)
r <- raster::interpolate(meuse.grid, model)
r <- raster::mask(r, meuse.grid)
Pal <- function(n) GetColors(n, stops=c(0.3, 0.9))
breaks <- seq(0, 2000, by = 200)
credit <- paste("Data collected in a flood plain of the river Meuse,",
                "near the village of Stein (Netherlands),",
                "\nand iterpolated on a grid with 40-meter by 40-meter spacing",
                "using inverse distance weighting.")
PlotMap(r, breaks = breaks, pal = Pal, dms.tick = TRUE, bg.lines = TRUE,
        contour.lines = list(col = "#1F1F1F"), credit = credit,
        draw.key = FALSE, simplify = 0)
AddScaleBar(unit = c("KILOMETER", "MILES"), conv.fact = c(0.001, 0.000621371),
            loc = "bottomright", inset = c(0.1, 0.05))
AddGradientLegend(breaks, Pal, at = breaks,
                  title = "Topsoil zinc\nconcentration\n(ppm)", loc = "topleft",
                  inset = c(0.05, 0.1), strip.dim = c(2, 20))

m <- datasets::volcano
m <- m[nrow(m):1, ncol(m):1]
x <- seq(from = 2667405, length.out = ncol(m), by = 10)
y <- seq(from = 6478705, length.out = nrow(m), by = 10)
r <- raster::raster(m, xmn = min(x), xmx = max(x), ymn = min(y), ymx = max(y),
                    crs = "+init=epsg:27200")
credit <- paste("Digitized from a topographic map by Ross Ihaka",
                "on a grid with 10-meter by 10-meter spacing.")
explanation <- "Elevation on Auckland's Maunga Whau volcano, in meters."
PlotMap(r, extend.z = TRUE, pal = GetColors(scheme = "DEM screen"),
        scale.loc = "bottomright", arrow.loc = "topright",
        explanation = explanation, credit = credit, shade = list(alpha = 0.3),
        contour.lines = list(col = "#1F1F1FA6"), useRaster = TRUE)

out <- PlotMap(r, file = "Rplots1.pdf")
print(out)

pdf(file = "Rplots2.pdf", width = out$din[1], height = out$din[2])
PlotMap(r)
raster::contour(r, col = "white", add = TRUE)
dev.off()

file.remove(c("Rplots1.pdf", "Rplots2.pdf"))
graphics.off()




