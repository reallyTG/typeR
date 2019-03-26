library(spftir)


### Name: spmws
### Title: Moving-average Smoothing Filter of a Mid-infrared Spectrum
### Aliases: spmws

### ** Examples

data(spData)
# Convert data frame to matrix
spectrum <- as.matrix(t(spData[, c("Wavenumber","A")]))
# Smoothed spectrum
mws <- spmws(spectrum = spectrum, N = 21)



