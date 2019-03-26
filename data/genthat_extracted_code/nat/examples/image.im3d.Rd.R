library(nat)


### Name: image.im3d
### Title: Method to plot spatially calibrated image arrays
### Aliases: image.im3d

### ** Examples

## Not run: 
##D LHMask=read.im3d(system.file('tests/testthat/testdata/nrrd/LHMask.nrrd',package='nat'))
##D image(imslice(LHMask,10), asp=TRUE)
##D # useRaster is appreciably quicker in most cases
##D image(imslice(LHMask,10), asp=TRUE, useRaster=TRUE)
## End(Not run)



