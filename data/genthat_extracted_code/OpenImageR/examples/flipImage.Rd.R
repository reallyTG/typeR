library(OpenImageR)


### Name: flipImage
### Title: flip image horizontally or vertically
### Aliases: flipImage

### ** Examples


path = system.file("tmp_images", "1.png", package = "OpenImageR")

im = readImage(path)

flp = flipImage(im, mode = 'vertical')




