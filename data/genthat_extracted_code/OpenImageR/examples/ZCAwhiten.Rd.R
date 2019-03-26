library(OpenImageR)


### Name: ZCAwhiten
### Title: zca whiten of an image
### Aliases: ZCAwhiten

### ** Examples


path = system.file("tmp_images", "1.png", package = "OpenImageR")

image = readImage(path)

res = ZCAwhiten(image, k = 20, epsilon = 0.1)




