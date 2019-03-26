library(OpenImageR)


### Name: uniform_filter
### Title: uniform filter (convolution with uniform kernel)
### Aliases: uniform_filter

### ** Examples


path = system.file("tmp_images", "1.png", package = "OpenImageR")

image = readImage(path)

filt = uniform_filter(image, c(4,4), conv_mode = "same")




