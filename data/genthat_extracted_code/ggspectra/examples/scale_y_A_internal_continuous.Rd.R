library(ggspectra)


### Name: scale_y_A_internal_continuous
### Title: Absorbance y-scale
### Aliases: scale_y_A_internal_continuous scale_y_A_total_continuous

### ** Examples

library(ggplot2)
library(photobiology)

ggplot(yellow_gel.spct, plot.qty = "absorbance") +
  geom_line() +
  scale_y_A_internal_continuous() +
  scale_x_wl_continuous()

ggplot(yellow_gel.spct, plot.qty = "absorbance") +
  geom_line() +
  scale_y_A_total_continuous() +
  scale_x_wl_continuous()




