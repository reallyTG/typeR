library(stapler)


### Name: staple_bin_img
### Title: Run STAPLE on a set of nifti images
### Aliases: staple_bin_img staple_multi_img

### ** Examples


n = 5
r = 1000
x = lapply(seq(n), function(i) {
   x = rbinom(n = r, size = 1, prob = 0.5)
   array(x, dim = c(10,10, 10))
 })
staple_out = staple_bin_img(x, set_orient = FALSE)

n = 5
r = 1000
x = lapply(seq(n), function(i) {
   x = rbinom(n = r, size = 5, prob = 0.5)
   array(x, dim = c(10,10, 10))
 })
staple_out = staple_multi_img(x, set_orient = FALSE)



