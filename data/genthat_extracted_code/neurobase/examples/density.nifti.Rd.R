library(neurobase)


### Name: density.nifti
### Title: Density of Values in an Image
### Aliases: density.nifti density.anlz

### ** Examples

img = nifti(array(rnorm(10^3), dim = rep(10, 3)))
mask = img > 0
density(img, mask = mask)



