library(ggspectra)


### Name: scale_y_counts_continuous
### Title: Raw-counts y-scale
### Aliases: scale_y_counts_continuous scale_y_counts_tg_continuous

### ** Examples

library(ggplot2)
library(photobiology)

ggplot(white_led.raw_spct) +
  geom_line() +
  scale_y_counts_continuous() +
  scale_x_wl_continuous()

ggplot(white_led.raw_spct) +
  geom_line() +
  scale_y_counts_continuous(0) +
  scale_x_wl_continuous()

ggplot(white_led.raw_spct) +
  geom_line() +
  scale_y_counts_tg_continuous() +
  scale_x_wl_continuous()




