library(metR)


### Name: scale_mag
### Title: Scale for vector magnitudes
### Aliases: scale_mag

### ** Examples

library(ggplot2)
g <- ggplot(seals, aes(long, lat)) +
    geom_vector(aes(dx = delta_long, dy = delta_lat), skip = 2)

g + scale_mag("Seals velocity")

g + scale_mag("Seals velocity", max = 1)

g + scale_mag("Seals velocity", max_size = 2)
g + scale_mag("Seals velocity", default_unit = "mm")



