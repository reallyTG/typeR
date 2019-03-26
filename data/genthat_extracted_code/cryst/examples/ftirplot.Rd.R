library(cryst)


### Name: ftirplot
### Title: Plots the Crystalline Area of a FTIR Spectrum of Starch
### Aliases: ftirplot

### ** Examples

# Convert data frame to matrix, select A-type starch
spectrum <- as.matrix(t(FTIR[, c('wavelength','A')]))
# List of crystallinity components
crs <- fitFTIRc(spectrum = spectrum, mu = 1180, sigma = 60, k = 1, lim = c(1190, 1160, 985, 955))
# Original matrix
original <- crs$original
# Gaussian curve fit
gauss <- crs$gauss
# Plots the crystalline area of a FTIR spectrum
ftirplot(spectrum=original, gauss=gauss, lim=c(1190, 1160, 985, 950))



