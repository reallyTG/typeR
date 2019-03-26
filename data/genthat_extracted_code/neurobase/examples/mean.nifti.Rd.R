library(neurobase)


### Name: mean.nifti
### Title: Mean of Values in an Image
### Aliases: mean.nifti mean.anlz

### ** Examples

img = nifti(array(rnorm(10^3), dim = rep(10, 3)))
mask = img > 0
mean(img, mask = mask)



