library(neurobase)


### Name: boxplot.nifti
### Title: Boxplot of Values in an Image
### Aliases: boxplot.nifti boxplot.anlz

### ** Examples

img = nifti(array(rnorm(10^3), dim = rep(10, 3)))
mask = img > 0
boxplot(img, mask = mask)



