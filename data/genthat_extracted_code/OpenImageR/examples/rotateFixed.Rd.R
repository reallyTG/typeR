library(OpenImageR)


### Name: rotateFixed
### Title: Rotate an image by 90, 180, 270 degrees
### Aliases: rotateFixed

### ** Examples


path = system.file("tmp_images", "3.jpeg", package = "OpenImageR")

image = readImage(path)

r = rotateFixed(image, 90)




