library(photobiologyFilters)


### Name: photobiologyFilters-package
### Title: photobiologyFilters: Spectral Transmittance Data for Filters
### Aliases: photobiologyFilters photobiologyFilters-package

### ** Examples

library(ggspectra)
library(photobiologyWavebands)

# Total number of spectra in the package
length(filters.mspct)

# SCHOTT filters example
schott
filters.mspct$OG530
filters.mspct[["OG530"]]
getWhatMeasured(filters.mspct$OG530)

# combining name (index) vectors
# blue glass filters
intersect(optical_glass, blue_filters)
# green plastic films
intersect(plastic_film, green_filters)

# A Plexiglas sheet
getWhatMeasured(filters.mspct$Sky_Blue_5C01_GT)
plot(filters.mspct$Sky_Blue_5C01_GT)
transmittance(filters.mspct$Sky_Blue_5C01_GT, Orange())
transmittance(filters.mspct$Sky_Blue_5C01_GT, NIR())




