library(neurobase)


### Name: quantile.nifti
### Title: Sample Quantiles
### Aliases: quantile.nifti quantile.anlz

### ** Examples

img = nifti(array(rnorm(10^3), dim = rep(10, 3)))
mask = img > 0
quantile(img, mask = mask)



