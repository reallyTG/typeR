library(neurobase)


### Name: hist.nifti
### Title: Histogram of Values in an Image
### Aliases: hist.nifti hist.anlz

### ** Examples

img = nifti(array(rnorm(10^3), dim = rep(10, 3)))
mask = img > 0
hist(img, mask = mask)



