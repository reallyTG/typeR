library(colorSpec)


### Name: interpolate
### Title: interpolate spectra
### Aliases: interpolate interpolate.colorSpec
### Keywords: colorSpec

### ** Examples

path = system.file( "extdata/stains/PhenolRed-Fig7.txt", package="colorSpec" )
wave = 350:650
phenolred = readSpectra( path, wavelength=wave )
pH = as.numeric( sub( '[^0-9]+([0-9]+)$', '\\1', specnames(phenolred) ) )
pHvec = seq(min(pH),max(pH),by=0.05)
phenolinterp = interpolate( phenolred, pH, pHvec )



