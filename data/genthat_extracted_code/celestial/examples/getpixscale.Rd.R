library(celestial)


### Name: getpixscale
### Title: Get Pixel Scale
### Aliases: getpixscale
### Keywords: pixscale

### ** Examples

## Not run: 
##D #The answer should be almost exactly 0.2 asec/pixel:
##D 
##D #Using FITSio and ProFit packages
##D image = readFITS(system.file("extdata", 'KiDS/G266035fitim.fits', package="ProFit"))
##D profitGetPixScale(image$hdr)
##D #Using astro package
##D image = read.fits(system.file("extdata", 'KiDS/G266035fitim.fits', package="ProFit"))
##D profitGetPixScale(image$hdr[[1]])
## End(Not run)



