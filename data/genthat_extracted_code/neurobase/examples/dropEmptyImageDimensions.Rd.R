library(neurobase)


### Name: dropEmptyImageDimensions
### Title: Drop Empty Image Dimensions
### Aliases: dropEmptyImageDimensions drop_empty_dim

### ** Examples

set.seed(5)
dims = rep(10, 3)
arr = array(rnorm(prod(dims)), dim = dims)
arr[,,10] = 0
nim = oro.nifti::nifti(arr)

dnim = dropEmptyImageDimensions(nim, keep_ind = TRUE)
new_nim = dnim$outimg
names(dnim)



