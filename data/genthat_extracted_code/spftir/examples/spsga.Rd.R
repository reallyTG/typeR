library(spftir)


### Name: spsga
### Title: Savitzky-Golay Smoothing Filter of a Mid-infrared Spectrum
### Aliases: spsga

### ** Examples

data(spData)
# Convert data frame to matrix
spectrum <- as.matrix(t(spData[, c("Wavenumber","A")]))
# Smoothed spectrum
sga <- spsga(spectrum=spectrum, p=2, sw= 21)



