## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
message = FALSE,
comment = "#>")

## ---- message = FALSE, fig.width = 7-------------------------------------
library(metR)
library(ggplot2)
library(data.table)
temperature <- copy(temperature)
temperature[, air.z := Anomaly(air), by = .(lat, lev)]

# Plot made with base ggplot
(g <- ggplot(temperature[lon %~% 180], aes(lat, lev, z = air.z)) +
        geom_contour(aes(color = ..level..)))

## ---- fig.width = 7------------------------------------------------------
g + 
    scale_y_level() +
    scale_x_latitude(ticks = 15, limits = c(-90, 90)) +
    scale_color_divergent()

## ---- fig.show='hold', fig.width = 3.3-----------------------------------
breaks = seq(100, 200, by = 10)
v <- setDT(melt(volcano))
ggplot(v, aes(Var1, Var2, z = value)) +
    stat_contour(aes(fill = ..level..), geom = "polygon", breaks = breaks) +
    geom_contour(color = "red", size = 0.2, breaks = 150) +
    geom_contour(color = "blue", size = 0.2, breaks = 160) +
    guides(fill = "none")

ggplot(v, aes(Var1, Var2, z = value)) +
    geom_contour_fill(breaks = breaks) +
    guides(fill = "none")

## ------------------------------------------------------------------------
# Adding missing values
v[, value.gap := value]
v[(Var1 - 40)^2 + (Var2 - 35)^2 < 50, value.gap := NA]

ggplot(v, aes(Var1, Var2, z = value.gap)) +
    geom_contour_fill(breaks = breaks, na.fill = TRUE) +
    geom_point(data = v[is.na(value.gap)], size = 0.1, alpha = 0.3)

## ----  fig.width = 7-----------------------------------------------------
ggplot(temperature[lev == 300], aes(lon, lat, z = air.z)) +
    geom_contour_fill() +
    scale_fill_divergent() +
    scale_x_longitude() +
    scale_y_latitude()

## ------------------------------------------------------------------------
ggplot(temperature[lev == 300], aes(lon, lat, z = air.z)) +
    geom_contour_fill() +
    geom_contour(color = "black") +
    geom_text_contour() +
    scale_fill_divergent() +
    scale_x_longitude() +
    scale_y_latitude()

## ------------------------------------------------------------------------
ggplot(temperature[lev == 300], aes(lon, lat, z = air.z)) +
    geom_contour_fill() +
    geom_contour2(color = "black") +
    geom_text_contour(stroke = 0.2) +
    scale_fill_divergent() +
    scale_x_longitude() +
    scale_y_latitude()

## ------------------------------------------------------------------------
ggplot(temperature[lev == 300], aes(lon, lat, z = air.z)) +
     geom_contour_fill() +
     geom_contour_tanaka() +
     scale_fill_divergent() +
     scale_x_longitude() +
     scale_y_latitude()

## ------------------------------------------------------------------------
data(geopotential)    # geopotential height at 700hPa for the southern hemisphere. 

ggplot(geopotential[, gh.base := gh[lon == 120 & lat == -50], by = date][
    , .(correlation = cor(gh.base, gh)), 
    by = .(lon, lat)],
    aes(lon, lat, z = correlation)) +
    geom_contour_fill(breaks = MakeBreaks(0.1)) +
    stat_subset(aes(subset = correlation > 0.5),
                geom = "point", size = 0.1) +
    scale_fill_divergent() +
    scale_x_longitude() +
    scale_y_latitude()

## ------------------------------------------------------------------------
ggplot(v, aes(Var1, Var2, z = value.gap)) +
    geom_contour_fill(breaks = breaks, na.fill = TRUE) +
    stat_subset(aes(subset = is.na(value.gap)), geom = "raster", 
                fill = "#EBEBEB")

## ---- fig.width = 7------------------------------------------------------
temperature[, c("t.dx", "t.dy") := Derivate(air.z ~ lon + lat,
                                            cyclical = c(TRUE, FALSE)), 
            by = lev]

(g <- ggplot(temperature[lev == 500], aes(lon, lat)) +
    geom_contour_fill(aes(z = air.z)) +
    geom_vector(aes(dx = t.dx, dy = t.dy), skip.x = 2, 
                skip.y = 1) +
    scale_y_latitude(limits = c(-90, 0)) +
    scale_x_longitude() +
    scale_mag())

## ------------------------------------------------------------------------
g + coord_polar()

## ------------------------------------------------------------------------
ggplot(temperature[lon %between% c(100, 200) & lat == -50], aes(lon, lev)) + 
    geom_arrow(aes(dx = dx(t.dx, lat), dy = dy(t.dy)), skip = 1) +
    scale_y_level() +
    scale_mag()

## ------------------------------------------------------------------------
(g <- ggplot(temperature[lev == 500], aes(lon, lat)) +
     geom_contour_fill(aes(z = air.z)) +
     geom_streamline(aes(dx = t.dy, dy = -t.dx), L = 10, res = 2,   
                     arrow.length = 0.3, xwrap = c(0, 360)) + 
     scale_y_latitude(limits = c(-90, 0)) +
     scale_x_longitude())

## ------------------------------------------------------------------------
g + coord_polar()

## ------------------------------------------------------------------------
ggplot(temperature[lev == 500], aes(lon, lat)) +
    geom_streamline(aes(dx = t.dy, dy = -t.dx, size = ..step.., alpha = ..step..,
                        color = sqrt(..dx..^2 + ..dy..^2)), arrow = NULL,
                    L = 10, res = 2, xwrap = c(0, 360), lineend = "round") + 
    scale_y_latitude(limits = c(-90, 0)) +
    scale_x_longitude() +
    viridis::scale_color_viridis(guide = "none") +
    scale_size(range = c(0, 1), guide = "none") +
    scale_alpha(guide = "none")

## ------------------------------------------------------------------------
ggplot(temperature[lev == 300], aes(lon, lat, z = air.z)) +
    geom_contour2(aes(color = ..level..), breaks = MakeBreaks(2)) +
    scale_color_divergent(guide = "legend",
                          breaks = MakeBreaks(2)) +
    scale_x_longitude() +
    scale_y_latitude() + theme(legend.position = "bottom")

## ------------------------------------------------------------------------
ggplot(temperature[lev == 300], aes(lon, lat, z = air.z)) +
    geom_contour_fill(breaks = MakeBreaks(2)) +
    scale_fill_divergent(guide = "colorstrip",
                         breaks = MakeBreaks(2)) +
    scale_x_longitude() +
    scale_y_latitude() + 
    theme(legend.position = "bottom")

## ------------------------------------------------------------------------
ggplot(v, aes(Var1, Var2)) +
    geom_relief(aes(z = value))

