## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
comment = "#>",
cache = FALSE
)

## ------------------------------------------------------------------------
library(metR)
library(data.table)
library(ggplot2)

# If out = "vars", returns information about the available variables and 
# dimensions
file <- system.file("extdata", "temperature.nc", package = "metR")
str(ReadNetCDF(file, out = "vars"))

## ------------------------------------------------------------------------
air <- ReadNetCDF(file, subset = list(lat = 90:0, level = 925))


ggplot(air, aes(lon, lat)) +
    geom_contour(aes(z = air, color = ..level..))

## ------------------------------------------------------------------------
air[, air2 := ReadNetCDF(file, out = "vector",
                         subset = list(lat = 90:0, level = 300))]

ggplot(air, aes(lon, lat)) +
    geom_contour(aes(z = air2, color = ..level..))

## ------------------------------------------------------------------------
# Not run because it needs internet access
# world <- GetTopography(0, 360, 90, -90, resolution = 1)

# ggplot(world, aes(lon, lat)) +
#     geom_raster(aes(fill = h/1000)) +
#     geom_contour(aes(z = h), breaks = 0, color = "black", size = 0.5) +
#     coord_fixed(expand = FALSE) +
#     scale_fill_gradientn(colors = topo.colors(6)[c(1, 2, 3, 4, 6)], 
#                          values = scales::rescale(c(-11, 0, 0, 2, 7)),
#                          guide = "none") +
#     theme_void()

## ------------------------------------------------------------------------
air[, land := MaskLand(lon, lat)]

ggplot(air, aes(lon, lat)) +
    geom_tile(aes(fill = land)) +
    coord_quickmap()

## ------------------------------------------------------------------------
ggplot(air[, .(air = mean(air) - 273.15), by = .(lat, land)],
       aes(lat, air)) +
    geom_line(aes(color = land))

## ------------------------------------------------------------------------
# Not run because it needs internet access
# rad <- GetSMNData(as.Date("2018-03-15"), type = "radiation")

# ggplot(rad, aes(date, global)) + 
#     geom_line(aes(color = station))

## ------------------------------------------------------------------------
data(geopotential)
# Weigthed geopotential anomaly
geopotential[, gh.t.w := Anomaly(gh)*sqrt(cos(lat*pi/180)), by = .(lon, lat, month(date))]

eof <- EOF(gh.t.w ~ date | lon + lat, data = geopotential, n = 1:2)
str(eof)

## ------------------------------------------------------------------------
ggplot(eof$right, aes(lon, lat)) +
    geom_contour_fill(aes(z = gh.t.w), binwidth = 0.01) +
    scale_fill_divergent() +
    coord_polar() +
    facet_wrap(~PC) 

DivideTimeseries(
    ggplot(eof$left, aes(date, gh.t.w)) +
        geom_line(aes(color = PC)) +
        scale_x_date(expand = c(0, 0)), 
    eof$left$date, n = 2, xlab = "date", ylab = "gh.t.w")

## ------------------------------------------------------------------------
geopotential <- geopotential[]
geopotential[sample(1:.N, .N*0.8), gh.na := gh]

geopotential[, imputed := ImputeEOF(gh.na ~ lon + lat | date, max.eof = 5)]
str(geopotential)

## ------------------------------------------------------------------------
# new grid
x.out <- seq(0, 360, by = 10)
y.out <- seq(-90, 0, by = 10)

interpolated <- geopotential[, Interpolate(gh | gh.t.w ~ lon + lat, x.out, y.out), 
                             by = date]

## ------------------------------------------------------------------------
geopotential[, gh.new := Interpolate(gh ~ lon + lat, lon, lat, 
                                     data = interpolated[date == d],
                                     grid = FALSE)$gh, 
             by = .(d = date)]

## ------------------------------------------------------------------------
geopotential[date == date[1],    # think: gh as a function of lon and lat
    c("gh.dlon", "gh.dlat") := Derivate(gh ~ lon + lat, 
                                        cyclical = c(TRUE, FALSE), 
                                        sphere = TRUE)]


ggplot(geopotential[date == date[1]], aes(lon, lat)) +
    geom_contour_fill(aes(z = gh)) +
    geom_vector(aes(dx = gh.dlon, dy = gh.dlat), skip = 2, 
                scale = 3e4) +
    coord_quickmap()

## ------------------------------------------------------------------------
geopotential[date == date[1], c("u", "v") := GeostrophicWind(gh, lon, lat)]

ggplot(geopotential[date == date[1]], aes(lon, lat)) +
    geom_contour(aes(z = gh)) +
    geom_vector(aes(dx = dlon(u, lat), dy = dlat(v)), 
                skip.y = 1, skip.x = 2, scale = 5e4) +
    coord_quickmap()

## ------------------------------------------------------------------------
# Density of air at 20°C and 1030hPa.
(rho <- IdealGas(1013*100, 20 + 273.15))

# Of course, the temperature of air at that density 
# and same pressure is 20°C.
IdealGas(1013*100, rho = rho) - 273.15

## ------------------------------------------------------------------------
# Relative humidity from T and Td
t <- 25 + 273.15
td <- 20 + 273.15
p <- 1000000
(rh <- ClausiusClapeyron(td)/ClausiusClapeyron(t))

# Mixing ratio
ws <- MixingRatio(p, ClausiusClapeyron(t))
(w <- ws*rh)

