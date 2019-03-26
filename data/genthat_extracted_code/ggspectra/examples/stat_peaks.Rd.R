library(ggspectra)


### Name: stat_peaks
### Title: Find peaks and valleys.
### Aliases: stat_peaks stat_valleys

### ** Examples

library(photobiology)
library(ggplot2)
# ggplot() methods for spectral objects set a default mapping for x and y.
ggplot(sun.spct) + geom_line() + stat_peaks()
ggplot(sun.spct) + geom_line() + stat_valleys()
ggplot(sun.spct) + geom_line() +
  stat_peaks(span = 21, geom = "point", colour = "red") +
  stat_peaks(span = 51, geom = "text", colour = "red",
             vjust = -0.3, label.fmt = "%3.0f nm")
ggplot(sun.spct, unit.out = "photon") + geom_point() +
  stat_peaks(span = 5, geom = "line", colour = "red")



