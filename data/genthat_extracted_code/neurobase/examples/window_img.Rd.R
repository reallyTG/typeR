library(neurobase)


### Name: window_img
### Title: nifti image windower
### Aliases: window_img

### ** Examples

  set.seed(5)
  dims = rep(10, 3)
  arr = array(rnorm(prod(dims)), dim = dims)
  nim = oro.nifti::nifti(arr)
  window_img(nim, window = c(1, 5))
  window_img(nim, window = c(1, 5), replace = "missing")
  tfile = tempimg(nim)
  window_img(tfile)
  window_img(as.factor(tfile))
  arr = window_img(img_data(nim))
  rnim = RNifti::readNifti(tfile)
  window_img(rnim, window = c(1, 5))
  range(window_img(rnim, window = c(1, 5)))
  window_img(rnim, window = c(1, 5), replace = "missing")
  range(window_img(rnim, window = c(1, 5), replace = "missing"))
   




