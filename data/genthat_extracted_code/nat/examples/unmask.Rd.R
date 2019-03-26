library(nat)


### Name: unmask
### Title: Make im3d image array containing values at locations defined by
###   a mask
### Aliases: unmask

### ** Examples

## Not run: 
##D # read in a mask
##D LHMask=read.im3d(system.file('tests/testthat/testdata/nrrd/LHMask.nrrd', package='nat'))
##D # pick out all the non zero values
##D inmask=LHMask[LHMask!=0]
##D # fill the non-zero elements of the mask with a vector that iterates over the
##D # values 0:9
##D stripes=unmask(seq(inmask)%%10, LHMask)
##D # make an image from one slice of that result array
##D image(imslice(stripes,11), asp=TRUE)
## End(Not run)



