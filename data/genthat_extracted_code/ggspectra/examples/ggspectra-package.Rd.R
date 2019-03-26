library(ggspectra)


### Name: ggspectra-package
### Title: ggspectra: Extensions to 'ggplot2' for Radiation Spectra
### Aliases: ggspectra ggspectra-package

### ** Examples

library(ggplot2)
library(photobiology)
library(photobiologyWavebands)

ggplot(sun.spct) + geom_line() + stat_peaks(span = NULL)

ggplot(sun.spct, aes(w.length, s.e.irrad)) + geom_line() +
  stat_peaks(span = 21, geom = "point", colour = "red") +
  stat_peaks(span = 51, geom = "text", colour = "red", vjust = -0.3,
             label.fmt = "%3.0f nm")

ggplot(polyester.spct, range = UV()) + geom_line()

plot(sun.spct)

plot(polyester.spct, UV_bands(), range = UV(),
     annotations = c("=", "segments", "labels"))




