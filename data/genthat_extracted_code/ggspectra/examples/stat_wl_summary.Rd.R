library(ggspectra)


### Name: stat_wl_summary
### Title: Average area under curve for regions.
### Aliases: stat_wl_summary

### ** Examples

library(photobiology)
library(ggplot2)
# ggplot() methods for spectral objects set a default mapping for x and y.
ggplot(sun.spct) + geom_line() +
  stat_wl_summary(geom = "hline")
ggplot(sun.spct) + geom_line() +
  stat_wl_summary(label.fmt = "mean = %.3f", color = "red", vjust = -0.3) +
  stat_wl_summary(geom = "hline", color = "red")




