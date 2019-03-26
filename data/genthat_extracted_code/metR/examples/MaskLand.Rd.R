library(metR)


### Name: MaskLand
### Title: Mask
### Aliases: MaskLand

### ** Examples


# Make a sea-land mask
mask <- temperature[lev == 1000, .(lon = lon, lat = lat, land = MaskLand(lon, lat))]
temperature <- temperature[mask, on = c("lon", "lat")]

# Take the temperature difference between land and ocean
diftemp <- temperature[,
          .(tempdif = mean(air[land == TRUE]) - mean(air[land == FALSE])),
           by = .(lat, lev)]
library(ggplot2)
ggplot(diftemp, aes(lat, lev)) +
    geom_contour(aes(z = tempdif, color = ..level..)) +
    scale_y_level() +
    scale_x_latitude() +
    scale_color_divergent()

# Mean temperature in the USA
usatemp <- temperature[, usa := MaskLand(lon, lat, mask = "usa")][
    , .(air = weighted.mean(air, cos(lat*pi/180))), by = .(usa, lev)][
        usa == TRUE]

ggplot(usatemp, aes(lev, air)) +
    geom_line() +
    scale_x_level() +
    coord_flip()




