library(ggspectra)


### Name: stat_wl_strip
### Title: Calculate colours from wavelength.
### Aliases: stat_wl_strip wl_guide

### ** Examples

library(photobiology)
library(ggplot2)
# ggplot() methods for spectral objects set a default mapping for x and y.
ggplot(sun.spct) + geom_line() +
  stat_wl_strip(ymax = -0.02, ymin = -0.04) +
  scale_fill_identity()

# on some graphic devices the output may show spurious vertical lines
ggplot(sun.spct) + wl_guide(alpha = 0.33, color = NA) + geom_line()




