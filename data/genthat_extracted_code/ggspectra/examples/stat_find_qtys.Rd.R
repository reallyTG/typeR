library(ggspectra)


### Name: stat_find_qtys
### Title: Find quantity value for target wavelength value.
### Aliases: stat_find_qtys

### ** Examples

library(photobiology)
library(ggplot2)
# ggplot() methods for spectral objects set a default mapping for x and y.
ggplot(yellow_gel.spct) + geom_line() +
  stat_find_qtys(target = "half.range")
ggplot(yellow_gel.spct) + geom_line() +
  stat_find_qtys(target = c(490, 500, 510))
ggplot(yellow_gel.spct) + geom_line() +
  stat_find_qtys(target = 500, geom = "point", colour = "red") +
  stat_find_qtys(target = 500, geom = "text", colour = "red",
             hjust = 1.1, label.fmt = "Tfr = %1.2f")



