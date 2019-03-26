library(ProFound)


### Name: profoundPixelCorrelation
### Title: Pixel to pixel correlation statistics
### Aliases: profoundPixelCorrelation profoundSkySplitFFT
### Keywords: correlation FFT

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D 
##D profound=profoundProFound(image, skycut=1.5, magzero=30, verbose=TRUE, plot=TRUE)
##D 
##D corout_raw=profoundPixelCorrelation(image$imDat, plot=TRUE)
##D magimage(corout_raw$fft, xlab='kx (2pi/356pix)', ylab='ky (2pi/356pix)')
##D points(0, 0, cex=10, col='red')
##D 
##D # There is clearly some residual structure masking out the brighter parts of objects:
##D 
##D corout_objects=profoundPixelCorrelation(image$imDat, sky=profound$sky,
##D skyRMS=profound$skyRMS, objects=profound$objects, plot=TRUE)
##D magimage(corout_objects$fft, xlab='kx (2pi/356pix)', ylab='ky (2pi/356pix)')
##D points(0, 0, cex=10, col='red')
##D 
##D # Using the more aggressive objects_redo removed nearly all of this:
##D 
##D corout_objects_redo=profoundPixelCorrelation(image$imDat, sky=profound$sky,
##D skyRMS=profound$skyRMS, objects=profound$objects_redo, plot=TRUE)
##D magimage(corout_objects_redo$fft, xlab='kx (2pi/356pix)', ylab='ky (2pi/356pix)')
##D points(0, 0, cex=10, col='red')
##D 
##D # We can use the pixel correlation function, in particular the FFT output, to assess how
##D # much further we can afford to push the source extraction in our image.
##D 
##D profound=profoundProFound(image, skycut=2.0, magzero=30, verbose=TRUE, plot=TRUE)
##D corout_objects_redo=profoundPixelCorrelation(image$imDat, sky=profound$sky,
##D skyRMS=profound$skyRMS, objects=profound$objects_redo)
##D magimage(corout_objects_redo$image_sky)
##D profoundProFound(corout_objects_redo$fft$z, skycut=2, verbose=TRUE, plot=TRUE)
##D 
##D profound=profoundProFound(image, skycut=1.5, magzero=30, verbose=TRUE, plot=TRUE)
##D corout_objects_redo=profoundPixelCorrelation(image$imDat, sky=profound$sky,
##D skyRMS=profound$skyRMS, objects=profound$objects_redo)
##D magimage(corout_objects_redo$image_sky)
##D profoundProFound(corout_objects_redo$fft$z, skycut=2, verbose=TRUE, plot=TRUE)
##D 
##D profound=profoundProFound(image, skycut=1.0, magzero=30, verbose=TRUE, plot=TRUE)
##D corout_objects_redo=profoundPixelCorrelation(image$imDat, sky=profound$sky,
##D skyRMS=profound$skyRMS, objects=profound$objects_redo)
##D magimage(corout_objects_redo$image_sky)
##D profoundProFound(corout_objects_redo$fft$z, skycut=2, verbose=TRUE, plot=TRUE)
##D 
##D profound=profoundProFound(image, skycut=0.8, magzero=30, verbose=TRUE, plot=TRUE)
##D corout_objects_redo=profoundPixelCorrelation(image$imDat, sky=profound$sky,
##D skyRMS=profound$skyRMS, objects=profound$objects_redo)
##D magimage(corout_objects_redo$image_sky)
##D profoundProFound(corout_objects_redo$fft$z, skycut=2, verbose=TRUE, plot=TRUE)
##D 
##D profound=profoundProFound(image, skycut=0.6, magzero=30, verbose=TRUE, plot=TRUE)
##D corout_objects_redo=profoundPixelCorrelation(image$imDat, sky=profound$sky,
##D skyRMS=profound$skyRMS, objects=profound$objects_redo)
##D magimage(corout_objects_redo$image_sky)
##D profoundProFound(corout_objects_redo$fft$z, skycut=2, verbose=TRUE, plot=TRUE)
##D 
##D # By doing ProFoundsource detection on the FFT itself it tells us if there are significant
##D # sources of a certain common scale (usually small) still in the image to extract.
##D # The levels above suggest we cannot push much further than a skycut=1.0. Clearly using
##D # skycut=0.6 introduces a lot of fake sources.
##D 
##D # We can improve the sky using profoundSkySplitFFT
##D 
##D profound=profoundProFound(image, type="bicubic")
##D newsky=profoundSkySplitFFT(image$imDat, objects=profound$objects_redo, sky=profound$sky,
##D skyRMS=profound$skyRMS)
##D 
##D # For convenience, the above is the same as running:
##D 
##D newsky=profoundSkySplitFFT(profound=profound)
##D 
##D # For super added convenience you can also un:
##D 
##D newsky=profoundSkySplitFFT(profound)
##D 
##D # Old versus new sky:
##D 
##D magimage(profound$sky)
##D magimage(newsky$sky)
##D 
##D # Original image, old sky subtraction and new sky subtraction (pretty subtle!):
##D 
##D magimage(image$imDat)
##D magimage(image$imDat-profound$sky)
##D magimage(image$imDat-newsky$sky)
##D 
##D # Be warned, you need a reasonable estimate of the sky and objects before running this.
##D # If we run on the original image that even the high/low k modes look very odd:
##D 
##D magimage(profoundSkySplitFFT(image$imDat)$sky_lo)
##D magimage(profoundSkySplitFFT(image$imDat)$sky_hi)
## End(Not run)



