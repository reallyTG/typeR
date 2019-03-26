library(ggspectra)


### Name: scale_y_Tfr_internal_continuous
### Title: Transmittance y-scale
### Aliases: scale_y_Tfr_internal_continuous scale_y_Tfr_total_continuous

### ** Examples

library(ggplot2)
library(photobiology)

ggplot(yellow_gel.spct) +
  geom_line() +
  scale_y_Tfr_internal_continuous() +
  scale_x_wl_continuous()

ggplot(yellow_gel.spct) +
  geom_line() +
  scale_y_Tfr_internal_continuous(-2) +
  scale_x_wl_continuous()

ggplot(yellow_gel.spct) +
  geom_line() +
  scale_y_Tfr_internal_continuous(-3) +
  scale_x_wl_continuous()

ggplot(yellow_gel.spct) +
  geom_line() +
  scale_y_Tfr_total_continuous() +
  scale_x_wl_continuous()




