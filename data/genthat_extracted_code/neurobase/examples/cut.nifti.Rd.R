library(neurobase)


### Name: cut.nifti
### Title: Perform Cut on an image
### Aliases: cut.nifti cut.anlz

### ** Examples

img = nifti(array(rnorm(10^3), dim = rep(10, 3)))
mask = img > 0
cut(img, mask = mask, breaks = 4)



