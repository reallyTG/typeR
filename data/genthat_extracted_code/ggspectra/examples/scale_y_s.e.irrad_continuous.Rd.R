library(ggspectra)


### Name: scale_y_s.e.irrad_continuous
### Title: Spectral irradiance y-scale
### Aliases: scale_y_s.e.irrad_continuous scale_y_s.q.irrad_continuous
###   scale_y_s.q.irrad_log10 scale_y_s.e.irrad_log10

### ** Examples

library(ggplot2)
library(photobiology)

ggplot(sun.spct) +
  geom_line() +
  scale_y_s.e.irrad_continuous() +
  scale_x_wl_continuous()

ggplot(sun.spct) +
  geom_line() +
  scale_y_s.e.irrad_continuous(-1) +
  scale_x_wl_continuous()

ggplot(sun.spct, unit.out = "photon") +
  geom_line() +
  scale_y_s.q.irrad_continuous() +
  scale_x_wl_continuous()

ggplot(sun.spct) +
  geom_line() +
  scale_y_s.e.irrad_log10() +
  scale_x_wl_continuous()

ggplot(sun.spct, unit.out = "photon") +
  geom_line() +
  scale_y_s.q.irrad_log10() +
  scale_x_wl_continuous()




