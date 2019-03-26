library(metR)


### Name: geom_contour_tanaka
### Title: Illuminated contours
### Aliases: geom_contour_tanaka GeomContourTanaka
### Keywords: datasets

### ** Examples

library(ggplot2)
library(data.table)
# A fresh look at the boring old volcano dataset
ggplot(melt(volcano), aes(Var1, Var2)) +
    geom_contour_fill(aes(z = value)) +
    geom_contour_tanaka(aes(z = value)) +
    theme_void() +
    viridis::scale_fill_viridis(guide = "none")

data(geopotential)
geo <- geopotential[date == unique(date)[4]]
geo[, gh.z := Anomaly(gh), by = lat]

# In a monochrome contour map, it's impossible to know which areas are
# local maximums or minimums.
ggplot(geo, aes(lon, lat)) +
    geom_contour2(aes(z = gh.z), color = "black", xwrap = c(0, 360))

# With tanaka contours, they are obvious.
ggplot(geo, aes(lon, lat)) +
    geom_contour_tanaka(aes(z = gh.z), dark = "black",
                        xwrap = c(0, 360)) +
    scale_fill_divergent()

# A good divergent color palette has the same luminosity for positive
# and negative values.But that means that printed in grayscale (Desaturated),
# they are indistinguishable.
(g <- ggplot(geo, aes(lon, lat)) +
    geom_contour_fill(aes(z = gh.z), xwrap = c(0, 360)) +
    scale_fill_gradientn(colours = c("#767676", "white", "#484848"),
                         values = c(0, 0.415, 1)))

# Tanaka contours can solve this issue.
g + geom_contour_tanaka(aes(z = gh.z))




