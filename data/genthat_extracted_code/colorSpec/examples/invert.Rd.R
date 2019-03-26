library(colorSpec)


### Name: invert
### Title: estimate spectra from responses, effectively inverting the
###   operator from spectrum to response
### Aliases: invert invert.colorSpec
### Keywords: colorSpec

### ** Examples

wave = 400:700
E.eye = product( illuminantE(1,wave), "material", xyz1931.1nm, wavelength=wave )
path = system.file( 'extdata/targets/CC_Avg30_spectrum_CGATS.txt', package='colorSpec' )
MacbethCC = readSpectra( path, wavelength=wave )
XYZ = product( MacbethCC, E.eye, wavelength=wave )
est.eq   = invert( E.eye, XYZ, method='centroid', alpha=1 )
extra   = extradata(est.eq)
range(extra$estim.precis)       # prints   0.000000e+00 3.191741e-08



