library(ggspectra)


### Name: stat_wb_irrad
### Title: Integrate irradiance for wavebands.
### Aliases: stat_wb_irrad stat_wb_e_irrad stat_wb_q_irrad

### ** Examples

library(photobiology)
library(photobiologyWavebands)
library(ggplot2)
# ggplot() methods for spectral objects set a default mapping for x and y.
ggplot(sun.spct) +
  stat_wb_column(w.band = VIS_bands()) +
  stat_wb_e_irrad(w.band = VIS_bands(),
                  angle = 90, size = 4,
                  label.fmt = "%2.0f", ypos.fixed = 0.1) +
  geom_line() +
  scale_fill_identity() + scale_color_identity()

ggplot(sun.spct) +
  stat_wb_box(w.band = VIS_bands()) +
  stat_wb_e_irrad(w.band = VIS_bands(),
                  angle = 90, size = 4,
                  label.fmt = "%2.0f") +
  geom_line() +
  scale_fill_identity() + scale_color_identity()




