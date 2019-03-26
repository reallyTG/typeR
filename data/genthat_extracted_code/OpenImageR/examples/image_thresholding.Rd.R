library(OpenImageR)


### Name: image_thresholding
### Title: image thresholding
### Aliases: image_thresholding

### ** Examples


path = system.file("tmp_images", "1.png", package = "OpenImageR")

image = readImage(path)

filt = image_thresholding(image, thresh = 0.5)




