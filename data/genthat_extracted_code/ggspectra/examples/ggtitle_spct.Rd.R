library(ggspectra)


### Name: ggtitle_spct
### Title: Add title to a spectral plot
### Aliases: ggtitle_spct

### ** Examples

library(ggplot2)
library(photobiology)

p <- ggplot(sun.spct) +
  geom_line()

p + ggtitle_spct(sun.spct)
p + ggtitle_spct(sun.spct, annotations = "title:where:when")




