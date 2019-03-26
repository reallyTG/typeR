library(ggspectra)


### Name: stat_wb_column
### Title: Integrate ranges under curve.
### Aliases: stat_wb_column

### ** Examples

library(photobiology)
library(photobiologyWavebands)
library(ggplot2)
# ggplot() methods for spectral objects set a default mapping for x and y.
ggplot(sun.spct) +
  stat_wb_column(w.band = VIS_bands()) +
  geom_line() +
  scale_fill_identity()

ggplot(sun.spct) +
  stat_wb_column(w.band = VIS_bands(), alpha = 0.5) +
  geom_line() +
  scale_fill_identity()




