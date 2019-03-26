library(OpenImageR)


### Name: RGB_to_HSV
### Title: Conversion of RGB to HSV colour type
### Aliases: RGB_to_HSV

### ** Examples


library(OpenImageR)

set.seed(1)
array_3d = array(sample(1:255, 675, replace = TRUE), c(15, 15, 3))

res = RGB_to_HSV(array_3d)




