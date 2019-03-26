library(ggspectra)


### Name: stat_label_peaks
### Title: Label peaks and valleys.
### Aliases: stat_label_peaks stat_label_valleys

### ** Examples

library(photobiology)
library(ggplot2)
# ggplot() methods for spectral objects set a default mapping for x and y.
ggplot(sun.spct) + geom_line() +
  stat_label_peaks(hjust = "left", span = 31, angle = 90, color = "red")
ggplot(sun.spct) + geom_line() +
  stat_label_valleys(hjust = "right", span = 21, angle = 90, color = "blue")

# using 'ggrepel' to avoid overlaps
# too slow for CRAN checks
## Not run: 
##D library(ggrepel)
##D library(photobiology)
##D ggplot(sun.spct) + geom_line() +
##D   stat_peaks(span = 41, shape = 21, size = 3) +
##D   stat_label_peaks(span = 41, geom = "label_repel", segment.colour = "red",
##D                    nudge_y = 0.12, label.fmt = "%3.0f nm") +
##D   scale_fill_identity() +
##D   scale_color_identity() +
##D   expand_limits(y = c(NA, 1))
## End(Not run)




