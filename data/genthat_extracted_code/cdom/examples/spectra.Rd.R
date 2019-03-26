library(cdom)


### Name: spectra
### Title: CDOM absorption data.
### Aliases: spectra
### Keywords: datasets

### ** Examples

library(ggplot2)
library(tidyr)
data("spectra")

spectra <- gather(spectra, sample, absorption, -wavelength)

ggplot(spectra, aes(x = wavelength, y = absorption, group = sample)) +
 geom_line(size = 0.1)



