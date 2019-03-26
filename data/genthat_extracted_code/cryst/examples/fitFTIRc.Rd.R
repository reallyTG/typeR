library(cryst)


### Name: fitFTIRc
### Title: Relative Crystallinity Calculation of FTIR Spectrum of Starch by
###   SUN Method
### Aliases: fitFTIRc

### ** Examples

# Convert data frame to matrix, select A-type starch
spectrum <- as.matrix(t(FTIR[, c('wavelength','A')]))
# List of crystallinity components
crs <- fitFTIRc(spectrum = spectrum, mu = 1180, sigma = 60, k = 1, lim = c(1190, 1160, 985, 955))
# Original matrix
original <- crs$original
# Gaussian curve fit
gauss <- crs$gauss
# Summary of Non-Linear Least-Squares Model Fits
fit <- crs$fit
# Summary calculation of crystallinity
summary <- crs$summary



