library(ggspectra)


### Name: scale_y_Rfr_specular_continuous
### Title: Reflectance y-scale
### Aliases: scale_y_Rfr_specular_continuous scale_y_Rfr_total_continuous

### ** Examples

library(ggplot2)
library(photobiology)

ggplot(yellow_gel.spct) +
  geom_line() +
  scale_y_Rfr_total_continuous() +
  scale_x_wl_continuous()

ggplot(yellow_gel.spct) +
  geom_line() +
  scale_y_Rfr_total_continuous(-2) +
  scale_x_wl_continuous()

ggplot(yellow_gel.spct) +
  geom_line() +
  scale_y_Rfr_total_continuous(-3) +
  scale_x_wl_continuous()

ggplot(yellow_gel.spct) +
  geom_line() +
  scale_y_Rfr_total_continuous() +
  scale_x_wl_continuous()




