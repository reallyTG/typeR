library(OpenImageR)


### Name: RGB_to_Lab
### Title: Conversion of RGB to Lab colour type
### Aliases: RGB_to_Lab

### ** Examples


library(OpenImageR)

set.seed(1)
array_3d = array(sample(1:255, 675, replace = TRUE), c(15, 15, 3))

res = RGB_to_Lab(array_3d)




