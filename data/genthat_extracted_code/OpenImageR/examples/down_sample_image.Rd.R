library(OpenImageR)


### Name: down_sample_image
### Title: downsampling an image ( by a factor ) using gaussian blur
### Aliases: down_sample_image

### ** Examples


path = system.file("tmp_images", "2.jpg", package = "OpenImageR")

image = readImage(path)

dsamp = down_sample_image(image, factor = 2.0, gaussian_blur = TRUE)




