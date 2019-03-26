library(OpenImageR)


### Name: rotateImage
### Title: Rotate an image using the 'nearest' or 'bilinear' method
### Aliases: rotateImage

### ** Examples


path = system.file("tmp_images", "2.jpg", package = "OpenImageR")

image = readImage(path)

r = rotateImage(image, 75, threads = 1)




