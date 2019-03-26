library(spftir)


### Name: spmbl
### Title: Linear Baseline Correction of a Mid-infrared Spectrum
### Aliases: spmbl

### ** Examples

data(spData)
# Convert data frame to matrix
spectrum <- as.matrix(t(spData[, c("Wavenumber","A")]))
# Linear baseline correction
mbl <- spmbl(spectrum=spectrum, lbl=c(1800, 1540, 840))



