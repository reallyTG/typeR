library(metR)


### Name: GeostrophicWind
### Title: Calculate geostrophic winds
### Aliases: GeostrophicWind

### ** Examples

data(geopotential)
geopotential <- data.table::copy(geopotential)
geopotential[date == date[1], c("u", "v") := GeostrophicWind(gh, lon, lat)]
library(ggplot2)
ggplot(geopotential[date == date[1]], aes(lon, lat)) +
    geom_contour(aes(z = gh)) +
    geom_vector(aes(dx = u, dy = v), skip = 2) +
    scale_mag()




