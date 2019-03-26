library(neurobase)


### Name: mask_img
### Title: Mask Image
### Aliases: mask_img

### ** Examples

  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  mask = abs(nim) > 1
  masked = mask_img(nim, mask)
  mask[mask == 0] = NA
  na_masked = mask_img(nim, mask, allow.NA = TRUE)



