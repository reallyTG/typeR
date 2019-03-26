library(ggspectra)


### Name: scale_y_cps_continuous
### Title: Counts-per-second y-scale
### Aliases: scale_y_cps_continuous

### ** Examples

library(ggplot2)
library(photobiology)

ggplot(white_led.cps_spct) +
  geom_line() +
  scale_y_cps_continuous() +
  scale_x_wl_continuous()

ggplot(white_led.cps_spct) +
  geom_line() +
  scale_y_cps_continuous(3) +
  scale_x_wl_continuous()




