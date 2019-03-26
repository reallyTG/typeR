library(ggspectra)


### Name: scale_x_wl_continuous
### Title: Wavelength x-scale
### Aliases: scale_x_wl_continuous

### ** Examples

library(ggplot2)
library(photobiology)

ggplot(sun.spct) +
  geom_line() +
  scale_x_wl_continuous()

ggplot(sun.spct) +
  geom_line() +
  scale_x_wl_continuous(-6)

ggplot(sun.spct) +
  geom_line() +
  scale_x_wl_continuous(sec.axis = sec_axis_w_number())

ggplot(sun.spct) +
  geom_line() +
  scale_x_wl_continuous(unit.exponent = -6,
                        sec.axis = sec_axis_w_number())




