library(neurobase)


### Name: randomize_mask
### Title: Randomize Image based on Mask
### Aliases: randomize_mask

### ** Examples

  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  mask = abs(nim) > 1
  randomize_mask(nim, mask)



