library(ggspectra)


### Name: stat_find_wls
### Title: Find wavelength for target quantity value.
### Aliases: stat_find_wls

### ** Examples

library(photobiology)
library(ggplot2)
# ggplot() methods for spectral objects set a default mapping for x and y.
ggplot(yellow_gel.spct) + geom_line() +
  stat_find_wls(target = c(0.25, 0.5, 0.75))
ggplot(yellow_gel.spct) + geom_line() +
  stat_find_wls(target = "half.maximum", geom = "point", colour = "red") +
  stat_find_wls(target = "half.maximum", geom = "text", colour = "red",
             hjust = 1.1, label.fmt = "%3.0f nm")



