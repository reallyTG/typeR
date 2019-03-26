library(ProFit)


### Name: profitMakeGaussianPSF
### Title: Make a 2D Gaussian PSF (point source profile or point spread
###   function)
### Aliases: profitMakeGaussianPSF
### Keywords: PSF, gaussian, normal

### ** Examples

#Various FWHM:

magimage(profitMakeGaussianPSF(fwhm=1), stretch='lin')
magimage(profitMakeGaussianPSF(fwhm=3), stretch='lin')
magimage(profitMakeGaussianPSF(fwhm=5), stretch='lin')



