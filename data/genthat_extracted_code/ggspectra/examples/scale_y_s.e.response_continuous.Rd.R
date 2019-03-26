library(ggspectra)


### Name: scale_y_s.e.response_continuous
### Title: Spectral response y-scale
### Aliases: scale_y_s.e.response_continuous
###   scale_y_s.q.response_continuous

### ** Examples

library(ggplot2)
library(photobiology)

ggplot(ccd.spct) +
  geom_line() +
  scale_y_s.e.response_continuous(unit.exponent = 6) +
  scale_x_wl_continuous()

ggplot(ccd.spct, unit.out = "photon") +
  geom_line() +
  scale_y_s.q.response_continuous() +
  scale_x_wl_continuous()




