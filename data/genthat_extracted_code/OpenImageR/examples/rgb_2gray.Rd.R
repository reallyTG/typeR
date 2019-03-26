library(OpenImageR)


### Name: rgb_2gray
### Title: convert an RGB image to Gray
### Aliases: rgb_2gray

### ** Examples


path = system.file("tmp_images", "1.png", package = "OpenImageR")

image = readImage(path)

gray = rgb_2gray(image)




