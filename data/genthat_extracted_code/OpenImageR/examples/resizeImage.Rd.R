library(OpenImageR)


### Name: resizeImage
### Title: resize an image using the 'nearest neighbors' or the 'bilinear'
###   method
### Aliases: resizeImage

### ** Examples


path = system.file("tmp_images", "2.jpg", package = "OpenImageR")

image = readImage(path)

resiz = resizeImage(image, width = 32, height = 32, method = 'nearest')




