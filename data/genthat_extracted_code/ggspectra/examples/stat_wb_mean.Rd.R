library(ggspectra)


### Name: stat_wb_mean
### Title: Integrate ranges under curve.
### Aliases: stat_wb_mean

### ** Examples

library(photobiology)
library(photobiologyWavebands)
library(ggplot2)
# ggplot() methods for spectral objects set a default mapping for x and y.
ggplot(sun.spct) +
  stat_wb_column(w.band = VIS_bands()) +
  stat_wb_mean(w.band = VIS_bands(), angle = 90, color = "black") +
  geom_line() +
  scale_fill_identity() + scale_color_identity()

## Not run: 
##D # example takes long to run
##D library(ggrepel)
##D ggplot(sun.spct) +
##D   geom_line() +
##D   stat_wb_hbar(w.band = VIS_bands(), size = 1.5) +
##D   stat_wb_mean(w.band = VIS_bands(),
##D                geom = "label_repel", nudge_y = +0.03,
##D                segment.colour = NA) +
##D   scale_fill_identity() + scale_color_identity()
## End(Not run)




