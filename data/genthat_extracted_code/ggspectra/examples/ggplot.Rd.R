library(ggspectra)


### Name: ggplot
### Title: Create a new ggplot plot from spectral data.
### Aliases: ggplot ggplot.source_spct ggplot.response_spct
###   ggplot.filter_spct ggplot.reflector_spct ggplot.cps_spct
###   ggplot.calibration_spct ggplot.raw_spct ggplot.object_spct
###   ggplot.generic_mspct

### ** Examples

library(photobiology)
library(ggplot2)
ggplot(sun.spct) + geom_line()
ggplot(sun.spct, unit.out = "photon") + geom_line()

ggplot(yellow_gel.spct) + geom_line()
ggplot(yellow_gel.spct, plot.qty = "absorbance") + geom_line()

ggplot(Ler_leaf.spct) + facet_grid(~variable) + geom_line()
ggplot(Ler_leaf.spct) + aes(linetype = variable) + geom_line()




